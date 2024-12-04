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
    ]
    ++ (optionals enableGui [
      ./gui
    ]);

  config = {
    home = {
      packages = with pkgs; [
        # host user packages
      ];
    };
    manual = {
      html.enable = true;
      json.enable = true;
      manpages.enable = true;
    };
  };
}
