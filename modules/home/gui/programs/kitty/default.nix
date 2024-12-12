{ ... }:
{
  programs.kitty = {
    enable = true;
    # keybindings = {
    # };
    extraConfig = ''
      modify_font cell_height 110%
    '';
  };
}
