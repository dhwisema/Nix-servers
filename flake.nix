{
  description = "Flake for my oci linux servbor";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
   
    #home-manager till i decide to nuke it again
    # home-manager.url = "github:nix-community/home-manager";
    # home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: {
    

    nixosConfigurations.Nixbox = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./Hosts/Nixbox/configuration.nix
      ];
    };

  };
}
