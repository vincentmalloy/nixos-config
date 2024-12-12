{
  lib,
  config,
  ...
}:
{
  wayland.windowManager.hyprland = {
    settings = {
      "$mod" = "SUPER";
      "$primaryMonitor" = "HDMI-A-1";
      "$terminal" = "kitty";
      "$browser" = "firefox";
      "$launcher" = "wofi";
      "$fileManager" = "nautilus";
    };
  };
}
