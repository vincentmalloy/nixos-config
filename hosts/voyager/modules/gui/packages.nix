{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # terminal
    kitty
    # clipboard
    wl-clipboard
    # app launcher
    # wofi
    # file browser
    # xfce.thunar
    nautilus
    gvfs
    # image viewer
    geeqie
  ];
  services.gvfs.enable = true;
}
