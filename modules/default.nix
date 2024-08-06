{ inputs, pkgs, config, ... }:

{
  imports = [ 
    # system
    ./system/configuration.nix
    ./kaas

    # CLI
    ./tmux

    # tunnel
    ./cloudflared
    ];
}