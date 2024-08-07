{ lib, php83, fetchFromGitHub }:

php83.buildComposerProject (finalAttrs: {
  pname = "ppelican-panel";
  version = "v1.0.0-beta7";

  src = fetchFromGitHub {
    owner = "pelican-dev";
    repo = "panel";
    rev = finalAttrs.version;
    hash = "sha256-h0+6rDy7U24XEdqAnfd8Q77VE8Ji2llSxy/vQawPQw4=";
  };

  php83 = php83.buildEnv {
    extensions = ({ enabled, all }: enabled ++ (with all; [
      gd
      mysqli
      mbstring
      bcmath
      xml
      curl
      zip
      intl
      sqlite3
    ]));
  };

  composerStrictValidation = false;
  
  # The composer vendor hash
  vendorHash = lib.fakeHash;

  # If the composer.lock file is missing from the repository, add it:
  # composerLock = ./path/to/composer.lock;
})

/*
{ stdenvNoCC, fetchFromGitHub, php }:

stdenvNoCC.mkDerivation (finalAttrs:
let
  src = fetchFromGitHub {
    owner = "git-owner";
    repo = "git-repo";
    rev = finalAttrs.version;
    hash = "sha256-VcQRSss2dssfkJ+iUb5qT+FJ10GHiFDzySigcmuVI+8=";
  };
in {
  inherit src;
  pname = "php-app";
  version = "1.0.0";

  buildInputs = [ php ];

  nativeBuildInputs = [
    php.packages.composer
    # This hook will use the attribute `composerRepository`
    php.composerHooks.composerInstallHook
  ];

  composerRepository = php.mkComposerRepository {
    inherit (finalAttrs) src;
    # Specifying a custom composer.lock since it is not present in the sources.
    composerLock = ./composer.lock;
    # The composer vendor hash
    vendorHash = "sha256-86s/F+/5cBAwBqZ2yaGRM5rTGLmou5//aLRK5SA0WiQ=";
  };
})*/