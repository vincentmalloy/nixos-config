{lib, config, inputs, pkgs, ...}:
with lib;
let
  cfg = config.bundles.hyprland.hyprpaper;
in {
  options.bundles.hyprland.hyprpaper = {
    enable = mkEnableOption "hyprpaper wallpaper utility";
  };

  config = mkIf cfg.enable {
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
  };
}
