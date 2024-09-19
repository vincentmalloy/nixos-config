{
  lib,
  config,
  inputs,
  ...
}:
with lib; let
  cfg = config.bundles.nixvim;
in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./autocomplete.nix
    ./theme.nix
    ./options.nix
    ./keymaps.nix
    ./plugins
  ];

  options.bundles.nixvim = {
    enable = mkEnableOption "neovim nix configuration";
  };

  config = mkIf cfg.enable {
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
