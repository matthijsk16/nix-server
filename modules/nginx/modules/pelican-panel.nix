{ inputs, lib, config, pkgs, ... }:
with lib;
let
  name = "pelican-panel";
  cfg = config.modules.nginx.${name};
  serverName = "panel.kaasbois.nl";
  port = 81;
in
{
  options.modules.nginx.${name} = {
    enable = mkEnableOption "Enable ${name}";
  };

  config = mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [ port ];
    services.nginx.virtualHosts."${serverName}" = {
        inherit serverName;
        listen = [{ port = port; addr="0.0.0.0"; ssl=false; }];
        # addSSL = true;
        # enableACME = true;
        root = "/var/www/${serverName}/";
    };
  };
}
