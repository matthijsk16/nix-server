{ inputs, lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.nginx.pelican-panel;
in
{
  options.modules.nginx.pelican-panel = {
    enable = mkEnableOption "Enable Pelican page";
  };

  config = mkIf cfg.enable {
    services.nginx.virtualHosts."panel.kaasbois.nl" = {
        # addSSL = true;
        # enableACME = true;
        root = "/var/www/panel.kaasbois.nl/";
    };
  };
}
