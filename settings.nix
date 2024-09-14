{
  config,
  lib,
  ...
}: {
  # global default settings, can be overriden per host in hosts/<hostname>/settings.nix
  config.settings = lib.mkDefault {
    username = "simon";
    fullName = "Simon Lundius";
    githubUser = "vincentmalloy";
    githubId = "25029432";
    colorscheme = "gruvbox-material-dark-medium";
  };
}
