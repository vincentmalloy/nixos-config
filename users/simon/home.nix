{ lib, config, pkgs, ... }:

{
	home.username = lib.mkDefault "simon";
	home.homeDirectory = lib.mkDefault "/home/simon";

	programs.git = {
		enable = true;
		userName = "Simon Lundius";
		userEmail = "25029432+vincentmalloy@users.noreply.github.com";
	};
	
	home.packages = [
		pkgs.helix
	];
}
