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
        hash = "sha256-USKNTAvxmuxzhqA8e8XERr1U8513ONG54Md5vcDUERg=";
      };
      virtualHosts."https://calibre-web.tail8f3db1.ts.net".extraConfig = ''
        bind tailscale/calibre-web
        reverse_proxy localhost:8083
      '';
    };
  };
}
