 {
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.bundles.desktop.wofi;
in {
  options.bundles.desktop.wofi = {
    enable = mkEnableOption "wofi, app launcher";
  };

  config = mkIf cfg.enable {
programs.wofi = {
    enable = true;
    settings = {
      allow_images = true;
      allow_markup = true;
      content_halign = "center";
    };
  };

  };
}
