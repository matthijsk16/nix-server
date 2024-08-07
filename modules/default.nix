{ inputs, pkgs, config, ... }:

{
  imports = [ 
    # system
    ./system/configuration.nix
    ./ssh

    # CLI
    ./tmux

    # Webserver
    ./nginx

    # tunnel
    ./cloudflared
    ];
}