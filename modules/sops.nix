{ sops-nix, lib, config, ... }:
let
  isEd25519 = k: k.type == "ed25519";
  getKeyPath = k: k.path;
  keys = builtins.filter isEd25519 config.services.openssh.hostKeys;
in
{
  sops = {
    age.sshKeyPaths = map getKeyPath keys;
    secrets.TS_AUTHKEY = {
      sopsFile =./../host/secrets.yaml;
      # owner = config.services.caddy.user;
      # group = config.services.caddy.group;
      # mode = "600";
    };
  };
 # systemd.services.caddy.serviceConfig.EnvironmentFile = config.sops.secrets.TS_AUTHKEY.path;
}



