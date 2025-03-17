{
programs.firefox = {
	enable = true;
	languagePacks = [ "pl" "en-EN" ];
	profiles.better = { 	
	extension.packages = with pkgs.nur.repos.rycee.firefox-addons; [
		ublock-origin
		bitwarden
		sponsorblock
		return-youtube-dislikes
		terms-of-service-didnt-read
	];

	bookmarks = [];

	};
};

}
