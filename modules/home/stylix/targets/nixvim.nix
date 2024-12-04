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
  config = mkIf (cfg.enable && !osConfig.settings.isWSL) {
    stylix.targets.nixvim = {
      transparentBackground = {
        main = true;
        signColumn = false;
      };
    };
  };
}
