{ config, ...}: 
let
# image = config.lib.stylix.pixel "base0A";
in{
  stylix.image = ./image.jpg;
  # stylix = {
  #   inherit image;
  # };
}
