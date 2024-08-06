{ inputs, pkgs, config, ... }:

{
  imports =
    [ 
     # system
     ./system/configuration.nix

     # CLI
     ./tmux

     # tunnel
     ./cloudflared
    ];
}