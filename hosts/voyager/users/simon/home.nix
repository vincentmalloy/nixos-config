{ lib, config, pkgs, ... }:

{
	home.packages = [
		pkgs.lolcat
	];

	home.stateVersion = lib.mkDefault "24.05";
}
