{
  config,
  lib,
  pkgs,
  modulesPath,
  options,
  specialArgs,
  ...
}:
{
  services = {
    caddy = {
      enable = true; #this way until i figure out how to actually use the key correctly with sops-nix
      package = pkgs.caddy.withPlugins {
        plugins = [ "github.com/tailscale/caddy-tailscale@v0.0.0-20250207163903-69a970c84556" ];
        hash = "sha256-USKNTAvxmuxzhqA8e8XERr1U8513ONG54Md5vcDUERg=";
      };
      virtualHosts."https://calibre-web.tail8f3db1.ts.net".extraConfig = ''
        bind tailscale/calibre-web
        reverse_proxy localhost:8083
        '';
        globalConfig = ''
        tailscale {
          # Tailscale auth key used to register nodes.
          # auth_key {$TS_AUTHKEY}

          # Alternate control server URL. Leave empty to use the default server.
          # control_url <control_url>

          # If true, register ephemeral nodes that are removed after disconnect.
          # <since we depend on hostnames rather than URLs, this is fine for now>
          ephemeral false

          # Directory to store Tailscale state in. A subdirectory will be created for each node.
          # The default is to store state in the user's config dir (see os.UserConfDir).
          state_dir /var/lib/caddy/ts

          # If true, run the Tailscale web UI for remotely managing the node. (https://tailscale.com/kb/1325)
          # Default: false
          webui true
        }
      '';
    };

  };

}
