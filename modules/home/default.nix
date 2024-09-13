{lib, ...}: {
  imports = [
    ./vcs
  ];
  config.bundles.vcs.enable = lib.mkDefault true;
}
