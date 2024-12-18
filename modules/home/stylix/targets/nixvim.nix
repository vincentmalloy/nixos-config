{
  lib,
  myLib,
  config,
  osConfig,
  pkgs,
  ...
}:
with lib; let
  cfg = osConfig.stylix;
in {
  config = mkIf cfg.enable {
    stylix.targets.nixvim =
      if (myLib.isWSL osConfig)
      then {}
      else {
        transparentBackground = {
          main = true;
          signColumn = false;
        };
      };
  };
}
