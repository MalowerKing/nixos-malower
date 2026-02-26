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

        lsp.enable = true;

    languages = {
      enableTreesitter = true;

      clang.treesitter.enable = true;

      nix.enable = true;
      clang.enable = true;
      python.enable = true;
        python.lsp.enable = true;
    };

    autocomplete = {
      blink-cmp.enable = true;
    };
  };
}
