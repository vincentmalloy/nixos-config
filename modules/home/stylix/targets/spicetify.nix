{
  lib,
  config,
  osConfig,
  pkgs,
  ...
}:
with lib; let
  cfg = osConfig.stylix;
in {
  config = mkIf cfg.enable {
    stylix.targets = {
      spicetify.enable = false;
    };
  };
}
