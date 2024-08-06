{ inputs, pkgs, config, ... }:

{
  imports =
    [ 
     # system
     ./system

     # CLI
     ./tmux
    ];
}