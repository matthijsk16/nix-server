{ inputs, pkgs, config, ... }:

{
  imports = [ 
    # system
    ./system/configuration.nix
    ./ssh 

    # CLI
    ./tmux

    # tunnel
    ./cloudflared
    ];
}