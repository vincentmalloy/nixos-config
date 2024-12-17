{
  config,
  inputs,
  root,
  ...
}: {
  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit inputs;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${config.settings.username} = {
      imports = [
        inputs.spicetify-nix.homeManagerModules.default
        (root + /modules/home)
        ./modules/home
      ];
      home = {
        username = config.settings.username;
        stateVersion = config.system.stateVersion;
      };
    };
  };
}
