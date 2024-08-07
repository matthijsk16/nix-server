{ inputs, lib, config, pkgs, ... }:
with lib;
let
  name = "index";
  cfg = config.modules.nginx.${name};
  serverName = "kaasbois.nl";
  port = 80;
in
{
  options.modules.nginx.${name} = {
    enable = mkEnableOption "Enable ${name}";
  };

  config = mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [ port ];
    services.nginx.virtualHosts."${serverName}" = {
        serverName = hostname;
        listen = [{ port = port; addr="0.0.0.0"; ssl=false; }];
        # addSSL = true;
        # enableACME = true;
        root = "/var/www/${serverName}/";
    };
  };
}
