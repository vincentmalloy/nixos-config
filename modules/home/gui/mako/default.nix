{
  lib,
  config,
  pkgs,
  ...
}: {
  services.mako = {
    enable = true;
    package = pkgs.mako;
    defaultTimeout = 4000;
  };
}
