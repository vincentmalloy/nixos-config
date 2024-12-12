{
  config,
  osConfig,
  pkgs,
  ...
}:
{
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "about:blank";
          "browser.display.use_system_colors" = true;
          "browser.display.background_color.dark" = config.lib.stylix.colors.withHashtag.base00;
        };
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          keepassxc-browser
          feedbroreader
        ];
      };
    };
  };
}
