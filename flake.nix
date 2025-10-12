{
  description = "Flake for my oci linux servbor";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";
   
    #home-manager till i decide to nuke it again
    # home-manager.url = "github:nix-community/home-manager";
    # home-manager.inputs.nixpkgs.follows = "nixpkgs";

      sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows ="nixpkgs";
    };

  };

  outputs = {
    self,
    nixpkgs,nixpkgs-unstable,nixpkgs-master, disko, sops-nix,...
  }@inputs: {
    nixosConfigurations.Nixbox = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = { inherit inputs;};
      modules = [
          ({ config, pkgs, ... }:
          let
            calibre-web-unstable = final: prev: {
              calibre-web = nixpkgs-master.legacyPackages.system.calibre-web;
            };
             {
            nixpkgs.overlays = [ calibre-web-unstable ];
          };
         )


	sops-nix.nixosModules.sops
        ./host/configuration.nix
        disko.nixosModules.disko
        ./host/disk-config.nix

      ];
    };

  };
}
