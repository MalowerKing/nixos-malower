{
  imports = [
    ./modules/bundlePrograms.nix
    ./modules/kitty.nix
    ./modules/starship.nix
    ./modules/git.nix
    ./modules/fish.nix
    ./modules/plasmaBundle.nix
    ./modules/hyprland.nix
    ./modules/waybar.nix
    ./modules/dunst.nix
    ./modules/hyprpaper.nix
    ./modules/hypridle.nix
    ./modules/rofi.nix
  ];

  home = {
    username = "malower";
    homeDirectory = "/home/malower";
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}
