{
  config,
  inputs,
  root,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${config.settings.username} = {
      imports = [
        (root + /modules/home)
      ];
      home = {
        username = config.settings.username;
        stateVersion = config.system.stateVersion;
      };
    };
  };
}
