{
  pkgs,
  lib,
  ...
}: {
  networking.networkmanager = {
    enable = true;
    wifi.powersave = true;
  };

  networking.nameservers = ["1.1.1.1" "8.8.8.8"];

  programs.nm-applet.enable = true;
}
