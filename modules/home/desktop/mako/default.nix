{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.bundles.desktop.mako;
in {
  options.bundles.desktop.mako = {
    enable = mkEnableOption "mako, notification daemon";
  };

  config = mkIf cfg.enable {
    services.mako = {
      enable = true;
      package = pkgs.mako;
      defaultTimeout = 4000;
    };
  };
}
