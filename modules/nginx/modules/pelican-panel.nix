{ inputs, lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.nginx.pelican-panel;
  hostname = "panel.kaasbois.nl";
  port = 81;
in
{
  options.modules.nginx.pelican-panel = {
    enable = mkEnableOption "Enable Pelican page";
  };

  config = mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [ port ];
    services.nginx.virtualHosts."${hostname}" = {
        servername = hostname;
        listen = [{ port = port; addr="0.0.0.0"; ssl=false; }];
        # addSSL = true;
        # enableACME = true;
        root = "/var/www/${hostname}/";
    };
  };
}
