{ pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${import ./tokyo-night-sddm.nix { inherit pkgs; }}";
  };
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
