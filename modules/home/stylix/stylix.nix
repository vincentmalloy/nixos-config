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
    stylix = {
      opacity = {
        terminal = 0.8;
        applications = 1.0;
        desktop = 1.0;
      };
      fonts = {
        sizes = {
          terminal = 11;
          applications = 11;
        };
        monospace = {
          # package = pkgs.nerdfonts.override {fonts = ["CommitMono"];};
          # will be in nerd-fonts namespace in nixos 25
          package = if osConfig.settings.isWSL then pkgs.nerdfonts.override {fonts = ["CommitMono"];} else pkgs.nerd-fonts.commit-mono;
          name = "CommitMono Nerd Font";
        };
        serif = config.stylix.fonts.monospace;
        sansSerif = config.stylix.fonts.monospace;
        emoji = config.stylix.fonts.monospace;
      };
    };
  };
}
