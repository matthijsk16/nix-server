{ inputs, lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.nginx.index;
in
{
  options.modules.nginx.index = {
    enable = mkEnableOption "Enable homepage";
  };

  config = mkIf cfg.enable {
    services.nginxvirtualHosts."kaasbois.nl" = {
        # addSSL = true;
        # enableACME = true;
        root = "/var/www/kaasbois.nl/";
    };
  };
}
