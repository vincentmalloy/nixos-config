{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    portalPackage = pgs.xfg-desktop-portal-hyperland;
  };
}