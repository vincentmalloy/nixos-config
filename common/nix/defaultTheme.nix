{ pkgs, config, ... }
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${config.settings.colorscheme}.yaml";
    polarity = "dark";
    opacity = {
      terminal = 0.8;
      applications = 0.8;
    };
    fonts = {
      sizes = {
        terminal = 11;
      };
      packages = with pkgs; [
        commit-mono
        font-awesome
      ];
      monospace = {
        package = pkgs.commit-mono;
        name = "CommitMono";
      };
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;
    };
    # image = "${config.home.homeDirectory}/nixos-config/images/desktop/desktop_left.jpg";
  };
}
