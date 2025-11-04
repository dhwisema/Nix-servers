{
  # This will add secrets.yml to the nix store
  # You can avoid this by adding a string to the full path instead, i.e.
  # sops.defaultSopsFile = "/root/.sops/secrets/example.yaml";
  sops.defaultSopsFile = ./secrets/secrets.yaml;
  # This will automatically import SSH keys as age keys
  sops.age.sshKeyPaths = [ "/home/howard/id_ed25519" ];
  # This is using an age key that is expected to already be in the filesystem
  sops.age.keyFile = "/var/lib/sops-nix/key.txt";
  # This will generate a new key if the key specified above does not exist
  sops.age.generateKey = true;
  # This is the actual specification of the secrets.

    "Booklore/secrets/APP_USER_ID" = {};
    "Booklore/secrets/APP_GROUP_ID" = {};
    "Booklore/secrets/TZ" = {};
    "Booklore/secrets/BOOKLORE_PORT" = {};
    "Booklore/secrets/DATABASE_URL" = {};
    "Booklore/secrets/DB_USER" = {};
    "Booklore/secrets/DB_PASSWORD" = {};
    "Booklore/secrets/DB_USER_ID" = {};
    "Booklore/secrets/DB_GROUP_ID" = {};
    "Booklore/secrets/MYSQL_ROOT_PASSWORD" = {};
    "Booklore/secrets/MYSQL_DATABASE" = {};
}

