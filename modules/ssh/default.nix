{ inputs, lib, config, pkgs, ... }:
let
  cfg = config.modules.ssh;
in
{
  options.modules.ssh = {
    enable = lib.mkEnableOption "ssh";

    passwordAuthentication = lib.mkOption {
      type = types.bool;
      default = true;
      description = ''
        Enable password authentication.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    services.openssh = {
        enable = true;
        ports = [ 22 ];

        settings = {
          PasswordAuthentication = cfg.passwordAuthentication;
        };
      };
  };
}