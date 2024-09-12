{inputs}: let
  myLib = (import ./default.nix) {inherit inputs;};

  outputs = inputs.self.outputs;
in rec {
  mkSystem = system: config:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs outputs myLib;
      };
      modules = [
        # import globally used custom options
        outputs.settings

        # import common nixos modules for all systems (can be enabled or not in hosts configuration.nix)
        outputs.nixosModules.default

        # import home-manager nixos module
        # inputs.home-manager.nixosModules.home-manager
        # import common home-manager modules for all systems (can be enabled or not in hosts home.nix)
        # outputs.homeManagerModules.default

        # import specific host configuration
        config
      ];
    };
}
