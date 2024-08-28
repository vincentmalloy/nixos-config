{ ... }:
{
  services = {
    xserver = {
      enable = true;
      layout = "de";
      xkbOptions = "caps:swapescape";
    };
    displayManager = {
        sddm = {
          enable = true;
          wayland.enable = true;
        };
    };
  };
}