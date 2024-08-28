{ ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "de";
        options = "caps:swapescape";
      };
    };
    displayManager = {
        sddm = {
          enable = true;
          wayland.enable = true;
        };
    };
  };
}
