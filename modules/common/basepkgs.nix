{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
     curl
     git
     wget
     lazygit
     yazi
     pik
     btop
  ];
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  }