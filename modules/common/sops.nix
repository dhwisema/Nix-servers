{
  # This will add secrets.yml to the nix store
  # You can avoid this by adding a string to the full path instead, i.e.
  # sops.defaultSopsFile = "/root/.sops/secrets/example.yaml";
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  # This will automatically import SSH keys as age keys
  sops.age.sshKeyPaths = [ "/home/howard/.ssh/id_ed25519" ];
  # This is using an age key that is expected to already be in the filesystem
  sops.age.keyFile = "/var/lib/sops-nix/key.txt";
  # This will generate a new key if the key specified above does not exist
  sops.age.generateKey = true;
  # This is the actual specification of the secrets.

  # sops.secrets."Booklore/DATABASE_URL" = {};
  # sops.secrets."Booklore/DB_USER" = {};
  # sops.secrets."Booklore/DB_PASSWORD" = {};
  # sops.secrets."mariaDB/MYSQL_ROOT_PASSWORD" = {};
  # sops.secrets."mariaDB/MYSQL_DATABASE" = {};


}
