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
      ./programs
      ./spotify
    ]
    ++ (optionals enableGui [
      ./gui
    ]);

  config = {
    home = {
      packages = with pkgs; [
        # host user packages
        # scripts
        (writeShellScriptBin "bloodwestbackup" ''
          backupfolder=$HOME"/scripts/bloodwestbackup"
          pushd $backupfolder
          /usr/bin/env zsh ./bloodwestbackup.zsh
          hyprctl notify 5 5000 "rgb(00ff00)" "savegame backed up!"
        '')
        (writeShellScriptBin "bloodwestrestore" ''
          backupfolder=$HOME"/scripts/bloodwestbackup"
          pushd $backupfolder
          /usr/bin/env zsh ./bloodwestrestore.zsh
          hyprctl notify 0 5000 "rgb(ffff00)" "savegame restored!"
        '')
      ];
    };
    manual = {
      html.enable = true;
      json.enable = true;
      manpages.enable = true;
    };
  };
}
