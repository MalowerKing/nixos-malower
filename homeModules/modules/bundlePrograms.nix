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
        unityhub
        monero-gui
        basicswap

    feh
    hyprshot
        zoom-us

    kdePackages.ark

    cowsay
    fortune
    lolcat
    wl-clipboard
    ripgrep
        acpi
        pwvucontrol

    bluez
    brightnessctl

        python3
  ];

  gtk.enable = true;
  qt.enable = true;
}
