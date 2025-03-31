{ pkgs, lib, ... }: {
config.vim = {
	statusline.lualine.enable = true;
	telescope.enable = true;
	viAlias = true;
	vimAlias = true;
        useSystemClipboard = true;
	languages = {
		enableLSP = true;
		enableTreesitter = true;
		

		nix.enable = true;
		clang.enable  = true;
		python.enable  = true;
	};
};

}
