{
  pkgs,
  config,
  ...
}: let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  session = "${pkgs.hyprland}/bin/Hyprland";
in {
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "${session}";
        user = "${config.settings.username}";
      };
      default_session = {
        command = "${tuigreet} --greeting 'Welcome to NixOS!' --user-menu --asterisks --remember --remember-user-session --time -cmd ${session}";
        # user = "greeter";
      };
    };
  };

  environment = {
    etc."greetd/environments".text = ''
      hyprland
    '';
    systemPackages = [
      pkgs.greetd.tuigreet
    ];
  };
}
