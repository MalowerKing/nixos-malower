{pkgs, ...}: {

nixpkgs.config = {
  allowUnfree = true;
};

home.packages  = with pkgs; [
fastfetch
btop
bitwarden-desktop
calibre
qbittorrent
libreoffice-fresh
kicad-small
spotify
vesktop
vlc
varia
lshw
arduino-ide
radarr
sonarr
readarr
prowlarr
];
}
