{lib, ...}: {
  imports = [
    ./vcs
    ./hyprland
  ];
  config.bundles.vcs.enable = lib.mkDefault true;
  config.bundles.hyprland.enable = lib.mkDefault true;
}
