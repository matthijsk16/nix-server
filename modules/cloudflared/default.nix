{ inputs, lib, config, pkgs, ... }:
with lib;
let
    cfg = config.modules.cloudflared;
    domain = "hubclup.nl";
in
{
    options.modules.cloudflared = {
        enable = mkEnableOption "cloudflared";
    };

    config = mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            cloudflared
        ];
        services.cloudflared = {
            enable = true;
            user = "cloudflared";
            tunnels = {
                "8b288ee8-ca9a-45d6-8b94-57768fa309e0" = {
                    credentialsFile = "./testkey.json";
                    default = "http_status:404";
                    # ingress.${domain}.service = "ssh://localhost:22";
                };
            };
        };
    };
}