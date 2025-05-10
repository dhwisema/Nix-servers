{
  description = "Flake for my oci linux servbor";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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
    nixpkgs, disko, sops-nix
    ...
  }: {
    

    nixosConfigurations.Nixbox = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./host/configuration.nix
        disko.nixosModules.disko
        ./host/disk-config.nix
      	../../modules/sops.nix  
      ];
    };

  };
}
