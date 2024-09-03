{ pkgs, ... }:
let
  tokyo-night-sddm = pkgs.libsForQt5.callPackage ./tokyo-night-sddm.nix { inherit pkgs; };
in
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    wayland.compositor = "kwin";
    # settings = {
    #   Wayland = {
    #     CompositorCommand = "hyprland";
    #   };
    # };
    theme = "tokyo-night-sddm"; #elarun, maldives, maya
  };
  environment.systemPackages = [
    pkgs.libsForQt5.qtgraphicaleffects
    tokyo-night-sddm
  ];
  # services = {
  #   xserver = {
  #     enable = true;
  #     xkb = {
  #       layout = "de";
  #       options = "caps:swapescape";
  #     };
  #   };
  #   displayManager = {
  #       sddm = {
  #         enable = true;
  #         wayland.enable = true;
  #       };
  #   };
  # };
}
