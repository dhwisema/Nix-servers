let
  optiplex = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC5hgjmvFRfw3Bax8y6gUMdSA691xm/Q07E5mbPxDjuA huntingdog5forsteam@gmail.com";
  nixbox   = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGVis9QeN9T6gpa4iGTs/3Bd1tOBP+q1EBx4AgZqtHC+ huntingdog5forsteam@gmail.com";
  MQ90     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDyiod6jLura0Eozwzwdsh+dup5QVpS0TZJIPSJa5Bn4 huntingdog5forsteam@gmail.com";
  laptop   = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFmXsOd9g4b2fLApvFsqtUOhlSQCxbBX54Cn+RgiB/Sy howard@laptop";
  systems  = [ optiplex nixbox MQ90 laptop ];
in
{
 "cwa.env".publicKeys = systems;
 # "secret1.age".publicKeys = [ user1 system1 ];
 # "secret2.age".publicKeys = users ++ systems;
 # "armored-secret.age" = {
 #   publicKeys = [ user1 ];
 #   armor = true;
 # };
}
