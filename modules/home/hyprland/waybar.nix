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
      '';
      settings = {
        mainBar = {

          modules-left = ["custom/hello-from-waybar"];

          "custom/hello-from-waybar" = {
            format = "hello {}";
            max-length = 40;
            interval = "once";
            exec = pkgs.writeShellScript "hello-from-waybar" ''
              echo "from within waybar"
            '';
          };
        };
      };
    };
  };
}
