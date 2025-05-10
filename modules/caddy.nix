{
  pkgs,
  ...
}:
{
  services = {
    caddy = {
      enable = true;
      package = pkgs.caddy.withPlugins {
        plugins = [ "github.com/tailscale/caddy-tailscale@v0.0.0-20250207163903-69a970c84556" ];
        hash = "sha256-UR9CG/zIslkXHDj1fDWmhx8hJZ8VLvZzOTGvGqqx1Ls=";
      };
      virtualHosts."https://tail8f3db1.ts.net".extraConfig = ''
        bind tailscale/calibre
        reverse_proxy localhost:8083
      '';
    };
  };
}