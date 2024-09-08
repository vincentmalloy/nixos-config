{ inputs, config, ... }:
{
  home-manager.extraSpecialArgs = {inherit inputs;}; 
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.${config.username} = {
    imports = [ 
      ../../users/${config.username}
      ./users/${config.username}/home.nix 
    ];
    home = {
      # inherit username;
    }; 
  };
} 
