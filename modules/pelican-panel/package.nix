{ stdenv, lib, fetchurl, curl, gnutar, pkgs }:


# with import <nixpkgs> { };

# pkgs.php83Packages.composer
stdenv.mkDerivation rec {
  pname = "pelican-panel";
  version = "1.0.0-beta7";

  src = fetchurl {
    url = "https://github.com/pelican-dev/panel/releases/download/v${version}/panel.tar.gz";
    sha256 = "sha256-ZQW4BNIa0+fMrSzAMbvJIsFMm4kVjEJEzb4BLvjvZiI=";
  };

  dontBuild = true;
  buildInputs = [ curl gnutar ];

  unpackPhase = ''
    mkdir -p $out/var/www/pelican
    cd $out/var/www/pelican
    tar -xzf $src
  '';

  installPhase = ''
    composer config -g repo.packagist composer https://packagist.org
    echo $(ls $out/var/www/pelican)
    cd $out/var/www/pelican
    composer update
    composer install --no-dev --optimize-autoloader -H
  '';

  propagatedBuildInputs = with pkgs; [
    php83
    php83Packages.composer 
    mysql84 
  ] ++ (with pkgs.php83Extensions; [
        gd
        mysql
        mbstring
        bcmath
        xml
        curl
        zip
        intl
        sqlite3
        fpm
  ]);

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
    platforms = platforms.unix;
  };
}