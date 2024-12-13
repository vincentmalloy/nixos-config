{inputs, ...}: {
  imports = [
    ./settings.nix
    ./modules/nix
    ./home.nix
  ];

  config = {
    system.stateVersion = "24.05";
  };
  # do something
}
