{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    cachix
  ];
  nixpkgs.config.allowUnfree = true;
  nix.package = pkgs.lixPackageSets.latest.lix;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.dates = "weekly";
    clean.extraArgs = "--keep 2";
    flake = "/home/howard/Nix-servers";
  };

  nix = {
    settings = {
      substituters = [
        "https://cache.nixos.org/"
        #"https://cache.garnix.io"
        "https://nix-community.cachix.org"
        #"https://nixpkgs-wayland.cachix.org"
      ];
      trusted-public-keys = [
        #"nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        # "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];

      auto-optimise-store = true; # Optimise syslinks
      allow-import-from-derivation = true;
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "@wheel" "howard"];
    };
  };
}
