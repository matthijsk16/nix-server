{ php83, fetchFromGitHub }:

php83.buildComposerProject (finalAttrs: {
  pname = "ppelican-panel";
  version = "v1.0.0-beta7";

  src = fetchFromGitHub {
    owner = "pelican-dev";
    repo = "panel";
    rev = finalAttrs.version;  # v1.0.0-beta7
    hash = "sha256-VcQRSss2dssfkJ+iUb5qT+FJ10GHiFDzySigcmuVI+8=";
  };

  php83 = php83.buildEnv {
    extensions = ({ enabled, all }: enabled ++ (with all; [
      gd
      # mysql
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
  vendorHash = "sha256-86s/F+/5cBAwBqZ2yaGRM5rTGLmou5//aLRK5SA0WiQ=";

  # If the composer.lock file is missing from the repository, add it:
  # composerLock = ./path/to/composer.lock;
})
