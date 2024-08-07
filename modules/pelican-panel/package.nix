{ lib, php83, fetchFromGitHub }:

php83.buildComposerProject (finalAttrs: {
  pname = "ppelican-panel";
  version = "v1.0.0-beta7";

  src = fetchFromGitHub {
    owner = "pelican-dev";
    repo = "panel";
    rev = finalAttrs.version;  # v1.0.0-beta7
    hash = "sha256-h0+6rDy7U24XEdqAnfd8Q77VE8Ji2llSxy/vQawPQw4=";
  };

  php83 = php83.buildEnv {
    extensions = ({ enabled, all }: enabled ++ (with all; [
      gd
      pdo_mysql
      mbstring
      bcmath
      xml
      curl
      zip
      intl
      sqlite3
      # fpm
    ]));
  };

  # The composer vendor hash
  # vendorHash = "sha256-86s/F+/5cBAwBqZ2yaGRM5rTGLmou5//aLRK5SA0WiQ=";
  vendorHash = lib.fakeHash;

  # If the composer.lock file is missing from the repository, add it:
  # composerLock = ./path/to/composer.lock;
})
