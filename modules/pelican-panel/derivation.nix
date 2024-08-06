{ stdenv, lib, fetchurl, gnutar, php83, mysql84 }:
# pkgs.php83Packages.composer
stdenv.mkDerivation rec {
  pname = "pelican-panel";
  version = "1.0.0-beta7";

  src = fetchurl {
    url = "https://github.com/pelican-dev/panel/releases/download/v${version}/panel.tar.gz";
    sha256 = "0000000000000000000000000000000000000000000000000000";
  };

  dontBuild = true;
  buildInputs = [ gnutar ];

  unpackPhase = ''
    mkdir -p $out/var/www/pelican
    cd $out/var/www/pelican
    gnutar -xzf $src
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
    license = licenses.gnupg;
    platforms = platforms.unix;
  };
}