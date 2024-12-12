{
  osConfig,
  config,
  ...
}:
{
  home.sessionVariables = {
    EZA_COLORS = "da=38;5;240:sn=38;5;250:sb=38;5;240";
  };

  programs.eza = {
    enable = true;
    icons = if osConfig.settings.isWSL then true else "auto";
    extraOptions = [
      "--group-directories-first"
    ];
  };
}
