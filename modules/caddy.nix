{
  pkgs,
  ...
}:
let # Change these values
  domain_name = "aaa.aaa.ts.net";
  secure_token = "test";
in
{
  services = {
    caddy = {
      enable = true;
      package = pkgs.caddy.withPlugins {
        plugins = [ "github.com/tailscale/caddy-tailscale@v0.0.0-20250207163903-69a970c84556" ];
        hash = "sha256-UR9CG/zIslkXHDj1fDWmhx8hJZ8VLvZzOTGvGqqx1Ls=";
      };
      virtualHosts."https://matrix.aaa.ts.net".extraConfig = ''
        bind tailscale/matrix
        reverse_proxy localhost:6167
      '';
    };
    matrix-conduit = {
      enable = true;
      settings.global = {
        # address = "127.0.0.1"; 
        address = "0.0.0.0";
        # Change this to `false` after the first user (admin) is registered,
        # and then run `$ nixos-rebuild switch`.
        allow_registration = true;
        registration_token = "${secure_token}";
        database_backend = "rocksdb";
        port = 6167;
        server_name = "${domain_name}";
      };
    };
  };
}
