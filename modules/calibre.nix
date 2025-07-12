{ config, lib, pkgs, ... }:{
  # Calibre-Web
  services.calibre-web= {
    package = pkgs.calibre-web.overrideAttrs ({ propagatedBuildInputs ? [ ], ... }: {
    propagatedBuildInputs = propagatedBuildInputs ++ [
    pkgs.python312Packages.packaging 
    pkgs.python312Packages.jsonschema 
    pkgs.python312Packages.setuptools
    pkgs.python312Packages.babel 
    pkgs.python312Packages.flask
    pkgs.python312Packages.pycountry
    pkgs.python312Packages.apscheduler
    pkgs.python312Packages.pypdf    
    pkgs.python312Packages.pytz
    pkgs.python312Packages.requests
    pkgs.python312Packages.sqlalchemy
    pkgs.python312Packages.tornado 
    pkgs.python312Packages.wand  
    pkgs.python312Packages.unidecode  
    pkgs.python312Packages.lxml  
    pkgs.python312Packages.chardet  
    pkgs.python312Packages.netifaces-plus  
    pkgs.python312Packages.urllib3  
    pkgs.python312Packages.regex  
    pkgs.python312Packages.bleach  
    pkgs.python312Packages.python-magic  
    pkgs.python312Packages.cryptography
    pkgs.python312Packages.installer
    
      ];});
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
