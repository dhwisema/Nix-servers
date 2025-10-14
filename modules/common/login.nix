{
  config,
  lib,
  ...
}:
{
  # Disable autologin.
  services.getty.autologinUser = null;

  # Disable documentation for minimal install.
  documentation.enable = true;
}
