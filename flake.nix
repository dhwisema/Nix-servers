{
  description = "Flake for my oci linux servbor";

  inputs = {
    
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    #portainer flake
    portainer-on-nixos.url = "gitlab:cbleslie/portainer-on-nixos";
    portainer-on-nixos.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    #agenix
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    agenix.inputs.darwin.follows = "";

  };

  outputs =
    {
      portainer-on-nixos,
      self,
      nixpkgs,
      disko,
      sops-nix,
      home-manager,
      agenix,
      ...
    }:
    {
      nixosConfigurations.Nixbox = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./host/oci/configuration.nix
          disko.nixosModules.disko
          ./host/oci/disk-config.nix
          agenix.nixosModules.default

          portainer-on-nixos.nixosModules.portainer
          {
            services.portainer = {
              enable = true; # Default false

              version = "latest";
              # Default latest, you can check dockerhub for
              # other tags.

              openFirewall = false; # Default false, set to 'true' if you want
              # to be able to access via the port on
              # something other than localhost.

              port = 9443;
              # Sets the port number in both the firewall and
              # the docker container port mapping itself.
            };
          }

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.howard = ./modules/common/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
      nixosConfigurations.Optiplex = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          ./host/optiplex/configuration.nix
          ./host/optiplex/disk-config.nix
          agenix.nixosModules.default

          portainer-on-nixos.nixosModules.portainer
          {
            services.portainer = {
              enable = true; # Default false

              version = "latest";
              # Default latest, you can check dockerhub for
              # other tags.

              openFirewall = false; # Default false, set to 'true' if you want
              # to be able to access via the port on
              # something other than localhost.

              port = 9443;
              # Sets the port number in both the firewall and
              # the docker container port mapping itself.
            };
          }

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.howard = ./modules/common/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };

      nixosConfigurations.MQ90 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          ./host/MQ90/configuration.nix
          ./host/MQ90/disk-config.nix
          agenix.nixosModules.default

          portainer-on-nixos.nixosModules.portainer
          {
            services.portainer = {
              enable = true; # Default false

              version = "latest";
              # Default latest, you can check dockerhub for
              # other tags.

              openFirewall = false; # Default false, set to 'true' if you want
              # to be able to access via the port on
              # something other than localhost.

              port = 9443;
              # Sets the port number in both the firewall and
              # the docker container port mapping itself.
            };
          }
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.howard = ./modules/common/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
      # nixos-anywhere --flake .#generic --generate-hardware-config nixos-generate-config ./hardware-configuration.nix <hostname>
      nixosConfigurations.generic = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          ./host/generic/disk-config.nix
          ./host/generic/configuration.nix
          ./host/generic/hardware-configuration.nix
          agenix.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.howard = ./modules/common/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
    };
}
