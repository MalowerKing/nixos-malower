{
  pkgs,
  lib,
  ...
}: {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    settings = {
      AutoLogin = {
        session = "Hyprland";
        user = "malower";
      };
    };
  };
}
