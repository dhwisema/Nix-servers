{
  config,
  lib,
  pkgs,
  ...
}:
{
  systemd.targets.multi-user.enable = true;
  # Enable passwordless sudo.
  security.sudo.extraRules = [
    {
      users = [ "howard" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  users = {
    mutableUsers = true;
    users.${"howard"} = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEOpf39CFo3U9gJBxb1DaIPrp3/NCfelkTN+yMSNPNt4 dhwisema@ncsu.edu"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOM/XkR4NfhrMX2WcGJ10aYnPGcQHg+Jplw5rHowMOo dhwisema@ncsu.edu"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFmXsOd9g4b2fLApvFsqtUOhlSQCxbBX54Cn+RgiB/Sy howard@laptop"
      ];
    };
  };
}
