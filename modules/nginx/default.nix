{ inputs, lib, config, pkgs, ... }:
{

  options = {
    services.nginx = {

      enable = lib.mkEnableOption "Enable nginx";

      virtualHosts = lib.mkOption {
        type = lib.types.attrsOf (lib.types.attrsOf (lib.types.attrsOf lib.types.str));
        default = {};
      };
    };
  };

  config = mkIf cfg.enable {
    # Open ports in the firewall.
    networking.firewall.allowedTCPPorts = [ 80 443 ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    
    services.nginx = {
      enable = true;
      virtualHosts = {
        "kaasbois.nl" = {
          addSSL = true;
          enableACME = true;
          root = ".";
        };
      };
    };
    security.acme = {
      acceptTerms = true;
      default.email = "admin@kaasbois.nl";
  };
}