{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.bundles.desktop.hyprland.hypridle;
in {
  options.bundles.desktop.hyprland.hypridle = {
    enable = mkEnableOption "hypridle idle daemon";
  };

  config = mkIf cfg.enable {
    services.hypridle = {
      enable = true;
      settings = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        listener = [
          {
            timeout = 1200;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
}
