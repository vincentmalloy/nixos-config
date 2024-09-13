{lib, config, ...}:
with lib;
let
  cfg = config.bundles.vcs;
in {
  imports = mkIf cfg.enable [
    ./git.nix
    ./github.nix
  ];

  options.bundles.vcs = {
    enable = mkEnableOption "vcs bundle";
  };

  config = mkIf cfg.enable {
    config.bundles.vcs.git.enable = mkDefault true;
    config.bundles.vcs.github.enable = mkDefault true;
  };
}
