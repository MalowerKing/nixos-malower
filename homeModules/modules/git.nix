{
  configs,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
        settings.user = {
    name = "KingMalower";
    email = "maciejzych2003@gmail.com";
                };
  };
}
