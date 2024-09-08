{config, ...}: {
  config.username = "simon";
  config.fullName = "Simon Lundius";

  imports = [
    ./home-manager-config.nix
    ./configuration.nix
  ];
}
