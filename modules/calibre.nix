{ config, lib, pkgs, ... }:{
  # Calibre-Web
  services.calibre-web= {
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
  
    users.groups.media = {};
    environment.systemPackages = with pkgs; [
      kepubify
      
  ];



}