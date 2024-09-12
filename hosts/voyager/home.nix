{
  inputs,
  outputs,
  config,
  ...
}: let
  settings = config.settings;
  nur = config.nur;
in {
  home-manager.extraSpecialArgs = {inherit inputs settings nur;};
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.${settings.username} = {
    imports = [
      ../../users/default
      ./users/default/home.nix
      inputs.nixvim.homeManagerModules.nixvim
      outputs.homeManagerModules.default
    ];
    home = {
      username = settings.username;
      stateVersion = config.system.stateVersion;
    };
  };
}
