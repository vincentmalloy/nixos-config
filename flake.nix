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
  };

  outputs = { self, nixpkgs, disko, home-manager }: {
		nixosConfigurations = {
			# voyager - home desktop
		  voyager = nixpkgs.lib.nixosSystem {
				specialArgs = {
					username = "simon";
					hostname = "voyager";
				};
				system = "x86_64-linux";
				modules = [
					disko.nixosModules.default
					(import ./hosts/voyager/disko-config.nix { device = "/dev/nvme0n1"; })
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.simon = { imports = [ ./users/simon/home.nix ./hosts/voyager/users/simon/home.nix ]; };
					}
					./hosts/voyager/configuration.nix
				];
			};
		};
  };
}
