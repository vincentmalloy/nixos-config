{
  description = "nixos System configurations";

  inputs = {
		nixpkgs = {
			url = "github:nixos/nixpkgs/nixos-unstable";
		};
		disko = {
			url = "github:nix-community/disko";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		hyprland = {
			type = "git";
			url = "https://github.com/hyprwm/Hyprland";
			submodules = true;
		};
		hyprpaper = {
			url = "github:hyprwm/hyprpaper";
		};
  };

  outputs = { self, nixpkgs, disko, home-manager, hyprland, hyprpaper }@inputs: {
		nixosConfigurations = {
			# voyager - home desktop
		  voyager = nixpkgs.lib.nixosSystem {
				specialArgs = {
					username = "simon";
					hostname = "voyager";
					inherit inputs;
				};
				system = "x86_64-linux";
				modules = [
					disko.nixosModules.default
					(import ./hosts/voyager/disko-config.nix { device = "/dev/nvme0n1"; })
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.backupFileExtension = "backup";
						home-manager.users.simon = { imports = [ ./users/simon ./hosts/voyager/users/simon/home.nix ]; };
						home-manager.extraSpecialArgs = {
							inherit inputs;
						};
					}
					./hosts/voyager/configuration.nix
				];
			};
		};
  };
}
