{ inputs, pkgs, ... }:
let
  nix-colors-lib = inputs.nix-colors.lib.contrib {inherit pkgs;};
in
{
  programs.nixvim = {
    colorscheme = "nix-${config.colorScheme.slug}";
    globals.transparent_enabled = true;
    extraPlugins = with pkgs.vimPlugins; [
      transparent-nvim
      (nix-colors-lib.vimThemeFromScheme {scheme = config.colorScheme;})
    ];
  };
}
