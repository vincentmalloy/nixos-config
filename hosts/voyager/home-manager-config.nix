{ inputs, ... }:
{
	home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.simon = {imports = [../../users/simon ./users/simon/home.nix];};
}
