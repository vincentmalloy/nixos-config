{ lib, ... }: {
  imports = [
    ./hyprland
  ];
  bundles.hyprland.enable = lib.mkDefault true;
}
