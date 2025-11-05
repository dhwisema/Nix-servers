{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./tailscale.nix
    # ./docker-compose.nix
  ];
}
