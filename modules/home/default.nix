{lib,...}: {
  imports = [
    ./vcs
  ];
  bundles.vcs.enable = lib.mkDefault true;
}
