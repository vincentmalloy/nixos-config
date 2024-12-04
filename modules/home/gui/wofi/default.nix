{
  lib,
  config,
  ...
}: {
  programs.wofi = {
    enable = true;
    settings = {
      allow_images = true;
      allow_markup = true;
      content_halign = "center";
    };
  };
}
