{
home.shell.enableFishIntegration = true;
programs.fish = {
	enable = true;
	interactiveShellInit = ''
	  set fish_greeting # Disable greeting
	starship init fish | source
        fastfetch
        alias rebuild="sudo nixos-rebuild switch --flake ./ && home-manager switch --flake ./"
        alias update="sudo nix flake update --flake ./ && sudo nixos-rebuild switch --flake ./ && home-manager switch --flake ./ && sudo nix-collect-garbage --delete-older-than 5d"
        alias reform="alejandro -c ~/nixos-malower"
        alias hr="home-manager switch --flake ./"
	'';
	plugins = [
	];
};
}
