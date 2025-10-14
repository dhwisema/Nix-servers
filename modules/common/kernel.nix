{
  pkgs,
  ...
}:
{
  #kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
