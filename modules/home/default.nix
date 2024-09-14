{lib, ...}: {
  imports = [
    ./vcs
    ./hyprland
    ./nixvim
  ];
  config.bundles.vcs.enable = lib.mkDefault true;
  config.bundles.hyprland.enable = lib.mkDefault true;
  config.bundles.nixvim.enable = lib.mkDefault true;
}
