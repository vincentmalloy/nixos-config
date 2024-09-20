{
  inputs,
  lib,
  config,
  # osConfig
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.hyprcursor
    pkgs.hyprpicker
    # pkgs.waybar
    # pkgs.nwg-look
  ];
  programs.wofi = {
    enable = true;
    settings = {
      allow_images = true;
      allow_markup = true;
      content_halign = "center";
    };
  };

  # qt = {
  #   enable = true;
  #   platformTheme.name = "kde";
  # };

  # gtk = {
  #   enable = true;
  #   theme.name = "Breeze-Dark";
  #   gtk3 = {
  #     extraConfig.gtk-application-prefer-dark-theme = true;
  #   };
  # };
}
