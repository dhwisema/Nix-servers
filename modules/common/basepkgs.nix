{
  config,
  lib,
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
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
