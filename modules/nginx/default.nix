{ inputs, lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.nginx;
in
{
  options.modules.nginx = {
    enable = mkEnableOption "Enable nginx";
  };

  config = mkIf cfg.enable {
    # Open ports in the firewall.
    networking.firewall.allowedTCPPorts = [ 80 443 ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    systemd.services.nginx.serviceConfig.ProtectHome = "read-only";
    # users.users.bois.homeMode = 750;
    services.nginx = {
      enable = true;
      
      virtualHosts = {
        "kaasbois.nl" = {
          # addSSL = true;
          # enableACME = true;
          # root = "/home/bois/nix-server/modules/nginx/";
          root = "/var/www/kaasbois.nl/";
        };
      };
    };
#     security.acme = {
#       acceptTerms = true;
#       default.email = "admin@kaasbois.nl";
#     };
  };
}