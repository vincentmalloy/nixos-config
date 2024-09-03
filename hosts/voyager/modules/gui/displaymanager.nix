{ pkgs, ... }:
let
  # tokyo-night-sddm = pkgs.libsForQt5.callPackage ./tokyo-night-sddm.nix { inherit pkgs; };
  sddm-astronaut-theme = pkgs.libsForQt5.callPackage ./sddm-astronaut-theme.nix { inherit pkgs; };
in
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme"; #elarun, maldives, maya
  };
  environment.systemPackages = [
    # pkgs.libsForQt5.qtgraphicaleffects
    sddm-astronaut-theme
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
