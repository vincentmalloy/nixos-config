{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.bundles.desktop.hyprland;
in {
  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      settings = {
        "$mod" = "SUPER";
          "$primaryMonitor" = "HDMI-A-1";
        "$terminal" = "kitty";
        "$browser" = "firefox";
      };
    };
  };
}
