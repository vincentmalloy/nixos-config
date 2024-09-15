{lib, ...}: {
  imports = [
    ./vcs
    ./nixvim
    ./desktop
  ];
  config.bundles.vcs.enable = lib.mkDefault true;
  config.bundles.desktop.enable = lib.mkDefault true;
  config.bundles.nixvim.enable = lib.mkDefault true;
}
