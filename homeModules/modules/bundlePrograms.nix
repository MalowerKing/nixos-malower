{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  home.packages = with pkgs; [
    fastfetch
    btop
    bitwarden-desktop
    calibre
    qbittorrent
    libreoffice-fresh
    kicad-small
    spotify
    vlc
    varia
    lshw
    arduino-ide
    obsidian
    vscode
    rar
    gimp
    simulide_1_2_0
    discord
    vencord
    gearlever
        anki
        path-of-building
        synfigstudio

    feh
    hyprshot

    kdePackages.ark

    cowsay
    fortune
    lolcat
    wl-clipboard
    ripgrep
        acpi

    bluez
    brightnessctl
  ];

  gtk.enable = true;
  qt.enable = true;
}
