{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # hyprpaper
    kitty
    mako
    wl-clipboard
    wofi
    waybar
    xfce.thunar
    geeqie
  ];
}
