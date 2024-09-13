{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.bundles.vcs;
in {
  imports = [
    ./git.nix
    ./github.nix
  ];

  options.bundles.vcs = {
    enable = mkEnableOption "vcs bundle";
  };

  config = mkIf cfg.enable {
    bundles.vcs.git.enable = mkDefault true;
    bundles.vcs.github.enable = mkDefault true;
  };
}
