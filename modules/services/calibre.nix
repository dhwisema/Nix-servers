{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Calibre-Web

  options = {
    Cweb.enable = lib.mkOption {

      type = lib.types.bool;
      default = false;
      description = " enable calibre-web";
    };
  };
  config = lib.mkIf config.Cweb.enable {

    services.calibre-web = {
      package = pkgs.calibre-web.overridePythonAttrs (old: rec {
        dependencies = old.dependencies ++ old.optional-dependencies.kobo;
      });

      enable = true;
      group = "media";
      listen = {
        ip = "0.0.0.0";
        #ip = "127.0.0.1";
        port = 8083;
      };
      options = {
        calibreLibrary = "/mnt/media/ebook";
        enableBookUploading = true;
        enableBookConversion = true;
        enableKepubify = true;
      };

    };

    users.groups.media = { };
    environment.systemPackages = with pkgs; [
      kepubify

    ];

  };

}
