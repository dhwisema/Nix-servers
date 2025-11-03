{
  config,
  lib,
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    curl
    git
    wget
    lazygit
    yazi
    pik
    compose2nix
    btop
    sqlite
  ];
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
}
