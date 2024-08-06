{ inputs, lib, config, pkgs, ... }:
with lib;
let
    cfg = config.modules.cloudflared;
in
{
    options.modules.cloudflared = {
        enable = mkEnableOption "cloudflared";
    };

    config = mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            cloudflared
        ];

        users.users.cloudflared = {
            group = "cloudflared";
            isSystemUser = true;
        };
        users.groups.cloudflared = { };

        systemd.services.my_tunnel = {
            wantedBy = [ "multi-user.target" ];
            after = [ "network.target" ];
            serviceConfig = {
                ExecStart = "${pkgs.cloudflared}/bin/cloudflared tunnel --no-autoupdate run --token=eyJhIjoiZTFhYTBjMTUyMzU5MTUzNzhlYWVlMTJiMGYwZjg1NTgiLCJ0IjoiOGIyODhlZTgtY2E5YS00NWQ2LThiOTQtNTc3NjhmYTMwOWUwIiwicyI6Ik5qSTRNemRoWlRBdE1qVXlPUzAwTldZMUxUaG1aVGt0WTJRMVlXRXlOakV4WW1WbCJ9";
                Restart = "always";
                User = "cloudflared";
                Group = "cloudflared";
            };
        };
    };
}