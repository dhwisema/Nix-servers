# Nix-servers
sops-nix stuff
# or to convert an ssh ed25519 key to an age key
$ mkdir -p ~/.config/sops/age
$ nix-shell -p ssh-to-age --run "ssh-to-age -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt"
