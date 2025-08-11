{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "tuigreet --remember --time --cmd Hyprland";
        user = "malower";
      };
      default_session = initial_session;
    };
  };
}
