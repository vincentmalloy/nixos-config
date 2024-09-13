  {lib, config, inputs, pkgs, ...}:
with lib;
let
  cfg = config.bundles.hyprland;
in {

  options.bundles.hyprland = {
    enable = mkEnableOption "hyprland nixos module";
  };

  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
  };
}
