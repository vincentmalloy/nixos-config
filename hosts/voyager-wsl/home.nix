{
  config,
  inputs,
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
        ../../modules/home
      ];
      home = {
        username = config.settings.username;
        stateVersion = config.system.stateVersion;
      };
    };
  };
}
