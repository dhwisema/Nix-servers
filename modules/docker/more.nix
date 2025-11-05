{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./booklore/docker-compose.nix
  ];
}
