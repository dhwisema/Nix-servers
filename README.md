# Nixservers my personal server config.
## To deploy to a new box do the following based on [disko](https://github.com/nix-community/disko) and [nixos-anywhere](https://github.com/nix-community/nixos-anywhere)

 1. Make sure you are able to access root ssh of host system ie in the
    nixos installer or in prior os
     1.1 Create a new folder for the new host. Create Configuration.nix and disk-config.nix. Leaving hardware-configuration.nix alone for
    now. 
     1.1. Also copy disk-config.nix to the generic host
     1.2 add new host to flake.nix
 2. Run on either laptop or desktop: `cd ~/Nix-servers && nix run github:nix-community/nixos-anywhere -- --generate-hardware-config nixos-generate-config ./hardware-configuration.nix --flake ./#generic --target-host root@<ip address> `
 3. If no errors found during install yay we installed nix to a new host. 
 4. Post install things to do
    4.1 Generate ssh key `ssh-keygen -C "<email>"`
    4.1.1 `cat ~/.ssh/id_ed25519.pub` get result and add ssh key to github account
    4.2 clone repo `git@github.com:dhwisema/Nix-servers.git`
    4.3 run ` nixos-rebuild switch --flake ~/Nix-servers#<correct device name (probably should be done from the get instead of how step 2 does it)>`
    4.4 tailscale setup `sudo tailscale up`
    4.4.1 authenticate tailscale

