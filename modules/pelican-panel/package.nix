{ stdenv, lib, fetchurl, gnutar, php83, mysql84 }:
# pkgs.php83Packages.composer
stdenv.mkDerivation rec {
  pname = "pelican-panel";
  version = "1.0.0-beta7";

  src = fetchurl {
    url = "https://github.com/pelican-dev/panel/releases/download/v${version}/panel.tar.gz";
    sha256 = "sha256-ZQW4BNIa0+fMrSzAMbvJIsFMm4kVjEJEzb4BLvjvZiI=";
  };

  # src = fetchFromGitHub {
  #   owner = "pelican-dev";
  #   repo = "panel";
  #   rev = "953ee940aa5955dfdad452dbdc46f48ca5e5bb55";
  #   sha256 = "sha256-ZQW4BNIa0+fMrSzAMbvJIsFMm4kVjEJEzb4BLvjvZiI=";
  # };

  dontBuild = true;
  buildInputs = [ gnutar ];

  unpackPhase = ''
    mkdir -p $out/var/www/pelican
    cd $out/var/www/pelican
    tar -xzf $src
  '';

  # installPhase = ''
  #   composer install --no-dev --optimize-autoloader
  # '';

  propagatedBuildInputs = [ php83 ];

  meta = with lib; {
    description = ''
      Pelican is the ultimate, 
      free game server control panel offering high flying security. 
      It's a breeze to manage your servers with our sleek and
       user-friendly interface. And thanks to Docker, 
       they all run in their own safe space.
    '';
    homepage = "https://pelican.dev/";
    license = licenses.mit;
    license = licenses.gnupg;
    platforms = platforms.unix;
  };
}