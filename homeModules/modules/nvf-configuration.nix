{
  pkgs,
  lib,
  ...
}: {
  config.vim = {
    statusline.lualine.enable = true;
    telescope.enable = true;
    viAlias = true;
    vimAlias = true;

    clipboard.providers.wl-clipboard.enable = true;

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      clang.treesitter.enable = true;

      nix.enable = true;
      clang.enable = true;
      python.enable = true;
    };

    autocomplete = {
      blink-cmp.enable = true;
    };
  };
}
