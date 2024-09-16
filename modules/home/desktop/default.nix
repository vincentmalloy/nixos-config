{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.bundles.desktop;
in {
  imports = [
    ./hyprland
    ./waybar
  ];

  options.bundles.desktop = {
    enable = mkEnableOption "graphical desktop user interface";
  };

  config = mkIf cfg.enable {
    bundles.desktop.hyprland.enable = mkDefault true;
    bundles.desktop.waybar.enable = mkDefault true;
  };
}
