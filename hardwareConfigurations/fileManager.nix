{pkgs, ...}: {
  programs = {
    thunar.enable = true;
    xfconf.enable = true;

    thunar.plugins = with pkgs.xfce; [
      thunar-volman
      thunar-archive-plugin
      thunar-media-tags-plugin
    ];
  };
  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };
}
