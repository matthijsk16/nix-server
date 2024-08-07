{ inputs, lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.nginx.index;
  hostname = "kaasbois.nl";
  port = 80;
in
{
  options.modules.nginx.index = {
    enable = mkEnableOption "Enable homepage";
  };

  config = mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [ port ];
    services.nginx.virtualHosts."${hostname}" = {
        serverName = hostname;
        listen = [{ port = port; addr="0.0.0.0"; ssl=false; }];
        # addSSL = true;
        # enableACME = true;
        root = "/var/www/${hostname}/";
    };
  };
}
