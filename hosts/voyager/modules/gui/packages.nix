{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # terminal
    kitty
    # clipboard
    wl-clipboard
    # app launcher
    wofi
    # status bar
    # waybar
    # file browser
    xfce.thunar
    # image viewer
    geeqie
  ];
}
