{
home.shell.enableFishIntegration = true;
programs.fish = {
	enable = true;
	interactiveShellInit = ''
	  set fish_greeting # Disable greeting
	starship init fish | source
        fastfetch
	'';
	plugins = [
	];
};
}
