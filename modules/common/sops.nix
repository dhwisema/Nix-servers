{
  # This will add secrets.yml to the nix store
  # You can avoid this by adding a string to the full path instead, i.e.
  # sops.defaultSopsFile = "/root/.sops/secrets/example.yaml";
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  # This will automatically import SSH keys as age keys
  sops.age.sshKeyPaths = [ "/home/howard/id_ed25519" ];
  # This is using an age key that is expected to already be in the filesystem
  sops.age.keyFile = "/var/lib/sops-nix/key.txt";
  # This will generate a new key if the key specified above does not exist
  sops.age.generateKey = true;
  # This is the actual specification of the secrets.

    sops.secrets."Booklore/Secrets/APP_USER_ID" = {};
    sops.secrets."Booklore/Secrets/APP_GROUP_ID" = {};
    sops.secrets."Booklore/Secrets/TZ" = {};
    sops.secrets."Booklore/Secrets/BOOKLORE_PORT" = {};
    sops.secrets."Booklore/Secrets/DATABASE_URL" = {};
    sops.secrets."Booklore/Secrets/DB_USER" = {};
    sops.secrets."Booklore/Secrets/DB_PASSWORD" = {};
    sops.secrets."Booklore/Secrets/DB_USER_ID" = {};
    sops.secrets."Booklore/Secrets/DB_GROUP_ID" = {};
    sops.secrets."Booklore/Secrets/MYSQL_ROOT_PASSWORD" = {};
    sops.secrets."Booklore/Secrets/MYSQL_DATABASE" = {};
}

