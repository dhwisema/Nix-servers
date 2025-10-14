{
  description = "Flake for my oci linux servbor";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      disko,
      ...
    }:
    {
      nixosConfigurations.Nixbox = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./host/oci/configuration.nix
          disko.nixosModules.disko
          ./host/oci/disk-config.nix

        ];
      };

      nixosConfigurations.MQ90 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./host/MQ90/configuration.nix
        ];
      };
    };
}
