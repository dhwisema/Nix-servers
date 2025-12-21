let
  optiplex = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA9gxeqbDvKWyaGDr1Q3MJcoBGjDnYBwGAR7xUyJZyDF";
  nixbox   = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAsvDrpDkFpsK+45tww6PESvE/cPv5F2PucM++r/Qm0r";
  MQ90     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBiC1DLAgAQF5Opvi6uvd06+mtm8c7+KMeLrhDYuzrf1";
  laptop   = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFmXsOd9g4b2fLApvFsqtUOhlSQCxbBX54Cn+RgiB/Sy";
  systems  = [ optiplex nixbox MQ90 laptop ];
in
{
 "secret1.age".publicKeys = systems;
 # "secret1.age".publicKeys = [ user1 system1 ];
 # "secret2.age".publicKeys = users ++ systems;
 # "armored-secret.age" = {
 #   publicKeys = [ user1 ];
 #   armor = true;
 # };
}
