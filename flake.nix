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
  };

  outputs = { self, nixpkgs, disko }: {
	nixosConfigurations = {
		voyager = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				disko.nixosModules.default
				./configuration.nix
			];
		};
	};
  };
}
