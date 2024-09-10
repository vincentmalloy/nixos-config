{...}: {
  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    viAlias = true;
    vimAlias = true;
  };

  imports = [
    ./theme.nix
    ./options.nix
    ./keymaps.nix
    ./plugins
  ];
}
