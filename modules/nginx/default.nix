{ inputs, lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.nginx;
in
{
  imports = [
    ./modules/index.nix
    ./modules/pelican-panel.nix
  ];

  options.modules.nginx = {
    enable = mkEnableOption "Enable nginx";
  };

  config = mkIf cfg.enable {
    services.nginx.enable = true;

    # Open ports in the firewall.
    networking.firewall.allowedTCPPorts = [ 80 443 ];

    # Setup SSL
#     security.acme = {
#       acceptTerms = true;
#       default.email = "admin@kaasbois.nl";
#     };
  };
}