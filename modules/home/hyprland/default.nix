{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
with lib; let
  cfg = config.bundles.hyprland;
in {
  imports = [
    ./hyprpaper.nix
    ./waybar.nix
  ];

  options.bundles.hyprland = {
    enable = mkEnableOption "hyprland window manager and additional tools";
  };

  config = mkIf cfg.enable {
    bundles.hyprland.hyprpaper.enable = mkDefault true;
    bundles.hyprland.waybar.enable = mkDefault true;
    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      settings = {
        misc = {
          "disable_hyprland_logo" = true;
        };
        exec-once = [
          "waybar"
          "[workspace special:quakemode]kitty"
        ];
        "$mod" = "SUPER";
        bind = [
          "$mod, Return, exec, kitty"
          "$mod, R, exec, pkill wofi || wofi --show drun"
          "$mod, M, exit"
          "$mod, Q, killactive"
          "$mod, F, exec, firefox"
          "$mod, V, togglefloating"
          "$mod, P, fullscreen, 1"
          # move focus
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"
          # move window
          "$mod ALT, left, movewindow, l"
          "$mod ALT, right, movewindow, r"
          "$mod ALT, up, movewindow, u"
          "$mod ALT, down, movewindow, d"
          # workspaces
          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          "$mod, 9, workspace, 9"
          "$mod, 0, workspace, 10"
          "$mod, ESCAPE, togglespecialworkspace, quakemode"
          "$mod SHIFT, ESCAPE, movetoworkspace, special:quakemode"
        ];
        bindm = [
          # move/resize windows
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];
        monitor = [
          "HDMI-A-1, preferred, 0x0, 1.5"
          "DP-1, preferred, auto-right, 1"
          "DP-2, preferred, auto-left, 1"
        ];
        windowrule = [
          # "opacity 0.5, ^(kitty)$"
        ];
        decoration = {
          blur = {
            size = 0;
          };
        };
        input = {
          kb_layout = "us";
        };
      };
      extraConfig = ''
        # window resize
        bind = $mod, S, submap, resize
  
        submap = resize
        binde = , right, resizeactive, 10 0
        binde = , left, resizeactive, -10 0
        binde = , up, resizeactive, 0 -10
        binde = , down, resizeactive, 0 10
        bind = , escape, submap, reset
        submap = reset
      '';
    };
  };
}
