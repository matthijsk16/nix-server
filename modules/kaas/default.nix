{ inputs, lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.kaas;
in
{
  options.modules.kaas = {
    enable = mkEnableOption "kaas";

    passwordAuthentication = mkOption {
      type = types.bool;
      default = true;
      description = ''
        Enable password authentication.
      '';
    };
  };

  config = mkIf cfg.enable {
    services.openssh = {
        enable = true;
        ports = [ 22 ];

        settings = {
          PasswordAuthentication = cfg.passwordAuthentication;
        };
      };
  };
}