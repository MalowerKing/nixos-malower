{

  imports = [
	./modules/bundlePrograms.nix
	./modules/kitty.nix
	./modules/starship.nix
	./modules/git.nix
	./modules/fish.nix
  ];

  home = {
    username = "malower";
    homeDirectory = "/home/malower";
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}
