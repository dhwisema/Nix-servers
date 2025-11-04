{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./calibre.nix
    ./tailscale.nix
    ./docker-compose.nix
  ];
}
