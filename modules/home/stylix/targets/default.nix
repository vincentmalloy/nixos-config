{lib, ...}: {
  imports = [
    ./nixvim.nix
  ];

  config = {
    stylix.targets = {
      spicetify.enable = false;
    };
  };
}
