{ lib, config, pkgs, ... }:

{
	home.username = lib.mkDefault "simon";
	home.homeDirectory = lib.mkDefault "/home/simon";
	
	home.packages = [
		pkgs.helix
	];
}
