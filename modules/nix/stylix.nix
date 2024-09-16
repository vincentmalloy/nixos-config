{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.bundles.stylix;
in {
  options.bundles.stylix = {
    enable = mkEnableOption "stylix systemwide theming";
  };

  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  config = mkIf cfg.enable {
    stylix = {
      enable = true;
      # this default configuration can be overwritten in users home-configuration
      base16Scheme = "${pkgs.base16-schemes}/share/themes/${config.settings.colorscheme}.yaml";
      polarity = "dark";
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
          # package = pkgs.commit-mono;
          package = pkgs.nerdfonts.override {fonts = ["CommitMono"];};
          name = "CommitMono Nerd Font";
        };
        serif = config.stylix.fonts.monospace;
        sansSerif = config.stylix.fonts.monospace;
        emoji = config.stylix.fonts.monospace;
      };
      targets = {
        nixvim = {
          transparentBackground = {
            main = true;
            signColumn = false;
          };
        };
      };
      # stylix needs an image to be set, we generate one here
      # image = config.lib.stylix.pixel "base01";
      image = ../../images/desktop/desktop_right.jpg;
    };
  };
}
