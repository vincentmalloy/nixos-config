{
  inputs,
  outputs,
  myLib,
  config,
  ...
}: {
  home-manager.extraSpecialArgs = {inherit inputs outputs myLib;};
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.${config.settings.username} = {
    imports = [
      ../../users/default
      ./users/default/home.nix
      inputs.nixvim.homeManagerModules.nixvim
      outputs.homeManagerModules.default
    ];
    home = {
      username = config.settings.username;
      stateVersion = config.system.stateVersion;
    };
    # enable/disable specific bundles or modules here, e.g.:
    # bundles.vcs.github.enable=false;
  };
}
