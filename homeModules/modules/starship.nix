{ pkgs, config, ... }:

{

xdg.configFile."starship.toml".source = ./starship.toml;

programs.starship = {
	enable = true;
	enableFishIntegration = true;
};
}
