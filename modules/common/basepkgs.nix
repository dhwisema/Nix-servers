{ config,inputs, lib, nixpkgs-master, pkgs, ... }:
{


   
  nixpkgs.overlays = [
    (final: _: {
      # this allows you to access `pkgs.unstable` anywhere in your config
      master = import inputs.nixpkgs-master {
        inherit (final.stdenv.hostPlatform) system;
        inherit (final) config;
      };
    })
  ];

  environment.systemPackages = with pkgs; [
     curl
     git
     wget
     lazygit
     yazi
     pik
     btop
     sqlite
     master.calibre-web
  ];
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  }