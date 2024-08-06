{ inputs, pkgs, config, ... }:

{
  imports =
    [ 
     # system
     ./bois-server/configuration.nix
    ];
}