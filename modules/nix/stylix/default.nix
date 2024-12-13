{
  lib,
  config,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    # this default configuration can be overwritten in users home-configuration
    base16Scheme = lib.mkDefault "${pkgs.base16-schemes}/share/themes/${config.settings.colorscheme}.yaml";
    polarity = "dark";
    # stylix needs an image to be set, we generate one here
    # image = config.lib.stylix.pixel "base01";
    image = ../../../images/desktop/desktop_right.jpg;
    # image = "${config.home-manager.users.${config.settings.username}.xdg.dataHome}/images/desktop/desktop_right.jpg";
  };
}
