{ inputs, lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.tmux;
in
{
  options.modules.tmux = {
    enable = mkEnableOption "tmux";

    defaultEditor = mkOption {
      type = types.str;
      default = environment.variables.EDITOR or "nano";
      description = ''
        The default editor to use when opening a new window or pane.
      '';
    };

    baseIndex = mkOption {
      type = types.int;
      default = 0;
      description = ''
        The base index to use for windows and panes.
      '';
    };

    escapeTime = mkOption {
      type = types.int;
      default = 0;
      description = ''
        The time in milliseconds to wait for an escape sequence.
      '';
    };

    plugins = mkOption {
      type = types.list types.str;
      default = [];
      description = ''
        A list of plugins to install.
      '';
    };
  };

  config = mkIf cfg.enable {
    programs.tmux = {
        defaultEditor = cfg.defaultEditor;
        baseIndex = cfg.baseIndex;
        escapeTime = cfg.escapeTime;

        plugins = with pkgs; cfg.plugins;
      };
  };
}