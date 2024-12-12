{
  lib,
  config,
  osConfig,
  inputs,
  ...
}:
let
  nixvim-key = if osConfig.settings.isWSL then "nixvim-wsl" else "nixvim";
in
{
  imports = [
    inputs.${nixvim-key}.homeManagerModules.nixvim
    ./autocomplete.nix
    ./theme.nix
    ./options.nix
    ./keymaps.nix
    ./plugins
  ] ++ lib.optionals osConfig.settings.isWSL [ ./wsl.nix ];

  config = {
    programs.nixvim = {
      enable = true;
      globals.mapleader = " ";
      viAlias = true;
      vimAlias = true;
      extraConfigVim = ''
        set exrc
      '';
    };
  };
}
