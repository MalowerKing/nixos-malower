# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../hardwareConfiguration/boot.nix
      ../../hardwareConfiguration/consoleKeymap.nix
      ../../hardwareConfiguration/locale.nix
      ../../hardwareConfiguration/networking.nix
      ../../hardwareConfiguration/printing.nix
      ../../hardwareConfiguration/settings.nix
      ../../hardwareConfiguration/sound.nix
      ../../hardwareConfiguration/wm-Plasma.nix
      ../../hardwareConfiguration/fonts.nix
    ];

    networking.hostName = "malower"; # Define your hostname.

   # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.malower = {
    isNormalUser = true;
    description = "Malower";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

 environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    home-manager 
    gohufont
 #  wget
  ];
  
  system.stateVersion = "24.11"; # Did you read the comment?

}
