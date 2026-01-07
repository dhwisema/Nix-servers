{
  config,
  lib,
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    compose2nix
    curl
    wget
    lazygit
    yazi
    pik
    btop
    sqlite
  ];
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
}
