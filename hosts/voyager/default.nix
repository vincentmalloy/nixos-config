{ config, ... }:
{
	config.username = "simon";

	imports = [
		./home-manager-config.nix
		./configuration.nix
	];
}
