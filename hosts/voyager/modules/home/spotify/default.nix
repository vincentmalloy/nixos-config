{
  lib,
  osConfig,
  config,
  pkgs,
  inputs,
  ...
}:
{
  home = {
    packages = with pkgs; [
      # librespot
    ];
  };

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        # adblock
        hidePodcasts
        shuffle # shuffle+ (special characters are sanitized out of extension names)
      ];
      # custom text theme
      theme = {
        name = "base16scheme";
        src = spicePkgs.themes.text.src;
        sidebarConfig = false;
        additionalCss =
          # css
          ''
            :root {
              --font-family: '${config.stylix.fonts.monospace.name}', monospace;
            }
          '';
      };
      # theme = spicePkgs.themes.text;
      colorScheme = "custom";
      customColorScheme = with osConfig.lib.stylix.colors; {
        text = base05;
        subtext = base05;
        main = base00;
        main-elevated = base02;
        highlight = base02;
        highlight-elevated = base03;
        sidebar = base01;
        player = base05;
        card = base04;
        shadow = base00;
        selected-row = base05;
        button = base05;
        button-active = base05;
        button-disabled = base04;
        tab-active = base02;
        notification = base02;
        notification-error = base08;
        equalizer = base0B;
        misc = base02;
      };
    };
  # authentication:
  # librespot -c ~/.cache/spotify-player -b 320
  # connect to device from player (e.g. on phone). credentials will be saved
  # then start spotify_player
  # programs.spotify-player = {
  #   enable = true;
  #   settings = {
  #     notify_timeout_in_secs = 2;
  #   };
  # };
}
