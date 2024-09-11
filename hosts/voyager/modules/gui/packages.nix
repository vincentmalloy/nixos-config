{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # hyprpaper
    kitty
    # libnotify
    mako
    # qt5.qtwayland
    # qt6.qtwayland
    # swayidle
    # swaylock-effects
    # wlogout
    # nwg-look
    wl-clipboard
    wofi
    waybar
    xfce.thunar
    geeqie
    # kdePackages.breeze-gtk
    # kdePackages.breeze-icons
    # kdePackages.breeze.qt5
    # kdePackages.breeze
  ];
}
