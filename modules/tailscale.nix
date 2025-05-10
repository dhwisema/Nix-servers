{ config, lib, pkgs, ... }:
{

services.tailscale.permitCertUid ="caddy";	
  services.tailscale.enable = true;
  services.tailscale.authKeyFile = config.sops.secrets.tailscale_key.path;
  }
