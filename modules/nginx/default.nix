{ inputs, lib, config, pkgs, ... }:
let
  cfg = config.modules.nginx;
in
{
  options.modules.nginx = {
    enable = lib.mkEnableOption "Enable nginx";
  };

  config = lib.mkIf cfg.enable {
    # Open ports in the firewall.
    networking.firewall.allowedTCPPorts = [ 80 443 ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    
    services.nginx = {
      enable = true;
      virtualHosts = {
        "kaasbois.nl" = {
          # addSSL = true;
          # enableACME = true;
          root = ".";
        };
      };
    };
#     security.acme = {
#       acceptTerms = true;
#       default.email = "admin@kaasbois.nl";
#     };
  };
}