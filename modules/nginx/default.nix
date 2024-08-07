{ inputs, lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.nginx;
in
{
  imports = [
    ./modules/index.nix
  ];

  options.modules.nginx = {
    enable = mkEnableOption "Enable nginx";
  };

  config = mkIf cfg.enable {
    # Open ports in the firewall.
    networking.firewall.allowedTCPPorts = [ 80 443 ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # systemd.services.nginx.serviceConfig.ProtectHome = "read-only";
    # users.users.bois.homeMode = 750;
    services.nginx.enable = true;
#     security.acme = {
#       acceptTerms = true;
#       default.email = "admin@kaasbois.nl";
#     };
  };
}