{
  lib,
  osConfig,
  pkgs,
  ...
}:
with lib; let
  enableGui = osConfig.settings.enableGui;
in {
  imports =
    [
      ./zsh
      ./oh-my-posh
      ./git
      ./nixvim
      ./stylix
      ./direnv
      ./eza
      ./programs
      ./helix
    ]
    ++ optionals enableGui [
      ./gui
    ];

  config = {
    home = {
      packages = with pkgs; [
        # default user packages
        tmux
      ];
      homeDirectory = lib.mkDefault "/home/${config.home.username}";
    };
  };
}
