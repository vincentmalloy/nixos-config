{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nwg-look
    adwaita-icon-theme
    glib
    gsettings-desktop-schemas
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
  ];
}
