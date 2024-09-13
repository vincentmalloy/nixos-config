{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.bundles.vcs.github;
in {
  options.bundles.vcs.github = {
    enable = mkEnableOption "github package and configuration";
  };

  config = mkIf cfg.enable {
    programs.gh = {
      enable = true;
      package = pkgs.gh;
    };
  };
}
