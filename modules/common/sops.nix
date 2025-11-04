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

    "Booklore/Secrets/APP_USER_ID" = {};
    "Booklore/Secrets/APP_GROUP_ID" = {};
    "Booklore/Secrets/TZ" = {};
    "Booklore/Secrets/BOOKLORE_PORT" = {};
    "Booklore/Secrets/DATABASE_URL" = {};
    "Booklore/Secrets/DB_USER" = {};
    "Booklore/Secrets/DB_PASSWORD" = {};
    "Booklore/Secrets/DB_USER_ID" = {};
    "Booklore/Secrets/DB_GROUP_ID" = {};
    "Booklore/Secrets/MYSQL_ROOT_PASSWORD" = {};
    "Booklore/Secrets/MYSQL_DATABASE" = {};
}
