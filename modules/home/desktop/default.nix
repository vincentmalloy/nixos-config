{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.bundles.desktop;
in {
  imports = [
    ./hyprland
    ./waybar
    ./mako
    ./wofi
  ];

  options.bundles.desktop = {
    enable = mkEnableOption "graphical desktop user interface";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      libnotify
    ];
    bundles.desktop.hyprland.enable = mkDefault true;
    bundles.desktop.waybar.enable = mkDefault true;
    bundles.desktop.mako.enable = mkDefault true;
    bundles.desktop.wofi.enable = mkDefault true;
  };
}
