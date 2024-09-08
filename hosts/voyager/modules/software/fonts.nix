{pkgs, ...}: {
  fonts.packages = with pkgs; [
    font-awesome
    open-sans
    commit-mono

    (nerdfonts.override {fonts = ["CommitMono"];})
  ];
}
