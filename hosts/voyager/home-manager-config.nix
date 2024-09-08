{
  inputs,
  config,
  ...
}: {
  home-manager.extraSpecialArgs = {inherit inputs;};
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.${config.username} = {
    imports = [
      ../../users/default
      ./users/default/home.nix
    ];
    home = {
      username = config.username;
    };
  };
}
