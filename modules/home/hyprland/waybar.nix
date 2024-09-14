{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.bundles.hyprland.waybar;
in {
  options.bundles.hyprland.waybar = {
    enable = mkEnableOption "waybar, desktop status bar";
  };

  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      package = pkgs.waybar;
      style = /* css */ ''
        window#waybar {
          background: @theme_base_color;
          border-bottom: 1px solid @unfocused_borders;
          color: @theme_text_color;
        }

        #pulseaudio-slider trough {
          min-width: 100px;
          background-color: @unfocused_borders;
        }
        #pulseaudio-slider highlight {
          min-width: 1px;
          background-color: @theme_text_color;
        }
        #pulseaudio-slider slider {
          background-color: @theme_text_color;
        }
      '';
      settings = let allBars = {
        reload_style_on_change = true;
      }; in{
        mainBar = allBars // {
          output = "HDMI-A-1";
          
          modules-left = [
            "hyprland/workspaces"
          ];
          modules-right = [
            "pulseaudio/slider"
            "clock"
          ];
          modules-center = [
            "hyprland/window"
          ];
          "pulseaudio/slider" = {
            min = 0;
            max = 100;
            orientation = "horizontal";
          };
        };

        leftBar = allBars // {
          output = "DP-2";
          
          modules-left = [
            "custom/hello-from-waybar"
          ];

          "custom/hello-from-waybar" = {
            format = "hello {}";
            max-length = 40;
            interval = "once";
            exec = pkgs.writeShellScript "hello-from-waybar" ''
              echo "from within waybar"
            '';
          };
        };
        
        rightBar = allBars // {
          output = "DP-3";
          modules-right = ["hyprland/language"];
        };
      };
    };
  };
}
