{...}: {
  imports = [
    ./hyprland
    ./waybar
    ./mako
    ./wofi
    ./programs
  ];

  /*
    config = {
      gtk = {
        enable = true;
        iconTheme = {
          package = pkgs.gruvbox-dark-icons-gtk;
          name = "gruvbox-dark-gtk";
        };
        gtk3.extraConfig = {
          gtk-application-prefer-dark-theme = 1;
        };
        gtk4.extraConfig = {
          gtk-application-prefer-dark-theme = 1;
        };
      };
  };
  */
}
