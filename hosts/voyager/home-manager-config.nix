{
  inputs,
  config,
  ...
}: let
  settings = config.settings;
in {
  home-manager.extraSpecialArgs = {inherit inputs settings;};
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.${settings.username} = {
    imports = [
      ../../users/default
      ./users/default/home.nix
    ];
    home = {
      username = settings.username;
      stateVersion = config.system.stateVersion;
    };
  };
}
