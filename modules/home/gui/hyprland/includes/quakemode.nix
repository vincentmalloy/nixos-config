{
  lib,
  config,
  ...
}: {
  wayland.windowManager.hyprland = {
    settings = {
      # exec-once = [
      #   "[workspace special:quakemode silent]kitty"
      # ];
      workspace = [
        "special:quakemode, monitor:$primaryMonitor, gapsin:0, gapsout:0, on-created-empty:$terminal"
        # "special:quakemode, monitor:HDMI-A-1, gapsin:0, gapsout:0"
      ];
      windowrulev2 = [
        "float, onworkspace:special:quakemode"
        "monitor $primaryMonitor, onworkspace:special:quakemode"
        "size 100% 50%, onworkspace:special:quakemode"
        "move 0 0, onworkspace:special:quakemode"
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
      bind = $mod, V, resizeactive, exact 100% 50%
      bind = $mod, V, moveactive, exact 0 0
      bind = $mod, ESCAPE, togglespecialworkspace, quakemode
      bind = $mod, ESCAPE, submap, reset
      submap = reset
    '';
  };
}
