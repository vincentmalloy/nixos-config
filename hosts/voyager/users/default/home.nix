{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.hypridle
    pkgs.hyprlock
    pkgs.hyprcursor
    pkgs.hyprpicker
    # pkgs.mako
    # pkgs.waybar
    # pkgs.nwg-look
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    settings = {
      # misc = {
      # 	"disable_hyprland_logo" = true;
      # };
      "$mod" = "SUPER";
      bind = [
        "$mod, Return, exec, alacritty"
        "$mod, R, exec, wofi --show drun"
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
          size = 2;
        };
      };
      input = {
        kb_layout = "de";
      };
    };
  };

  services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.hyprpaper;
    settings = {
      preload = [
        "~/nixos-config/images/desktop/desktop_left.jpg"
        "~/nixos-config/images/desktop/desktop_mid.jpg"
        "~/nixos-config/images/desktop/desktop_right.jpg"
      ];
      wallpaper = [
        "DP-1, ~/nixos-config/images/desktop/desktop_right.jpg"
        "DP-2, ~/nixos-config/images/desktop/desktop_left.jpg"
        "HDMI-A-1, ~/nixos-config/images/desktop/desktop_mid.jpg"
      ];
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "kde";
  };

  gtk = {
    enable = true;
    theme.name = "Breeze-Dark";
    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
  };
}
