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
  ];
}
