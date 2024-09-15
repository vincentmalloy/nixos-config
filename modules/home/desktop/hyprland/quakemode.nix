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
        # exec-once = [
        #   "[workspace special:quakemode silent]kitty"
        # ];
        workspace = [
          "special:quakemode, monitor:HDMI-A-1, gapsin:0, gapsout:0, on-created-empty:$terminal"
          # "special:quakemode, monitor:HDMI-A-1, gapsin:0, gapsout:0"
        ];
        windowrulev2 = [
          "float, onworkspace:special:quakemode"
          "size 100% 50%, onworkspace:special:quakemode"
        ];
        animation = [
          "specialWorkspace, 1, 4, default, slidefadevert -100%"
        ];
        bind = [
          "$mod, ESCAPE, focusmonitor, $primaryMonitor"
          "$mod, ESCAPE, togglespecialworkspace, quakemode"
          "$mod, ESCAPE, submap, quakemode"
          "$mod SHIFT, ESCAPE, movetoworkspace, special:quakemode"
          ];
      };
      extraConfig = ''
        submap = quakemode
        bind = $mod, F, fullscreen
        bind = $mod, ESCAPE, togglespecialworkspace, quakemode
        bind = $mod, ESCAPE, submap, reset
        submap = reset
      '';
    };
  };
}
