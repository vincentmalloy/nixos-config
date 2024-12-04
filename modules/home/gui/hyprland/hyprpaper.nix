{
  lib,
  config,
  inputs,
  pkgs,
  ...
}: {
  home.file = {
    "${config.xdg.dataHome}/images/desktop".source = ../../../../images/desktop;
  };
  services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.hyprpaper;
    settings = {
      preload = [
        "${config.xdg.dataHome}/images/desktop/desktop_left.jpg"
        "${config.xdg.dataHome}/images/desktop/desktop_mid.jpg"
        "${config.xdg.dataHome}/images/desktop/desktop_right.jpg"
      ];
      wallpaper = [
        "DP-1, ${config.xdg.dataHome}/images/desktop/desktop_right.jpg"
        "DP-2, ${config.xdg.dataHome}/images/desktop/desktop_left.jpg"
        "HDMI-A-1, ${config.xdg.dataHome}/images/desktop/desktop_mid.jpg"
      ];
    };
  };
}
