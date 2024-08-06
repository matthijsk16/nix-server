# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ../../modules/default.nix
  ];

  modules = {
    tmux = { enable = true; plugins = [pkgs.tmuxPlugins.better-mouse-mode]; };
    cloudflared.enable = true;
  };
    
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    bois = {
      isNormalUser = true;
      description = "De Bois";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
    cloudflared = {
      isSystemUser = true;
      description = "Cloudflared";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
  };

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
