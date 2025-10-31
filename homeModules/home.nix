{
  imports = [
    ./modules/bundlePrograms.nix
    ./modules/kitty.nix
    ./modules/starship/starship.nix
    ./modules/git.nix
    ./modules/fish.nix
    ./modules/hyprland/hyprland.nix
    ./modules/waybar/waybar.nix
    ./modules/dunst/dunst.nix
    ./modules/rofi.nix
  ];

  home = {
    username = "malower";
    homeDirectory = "/home/malower";
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}
