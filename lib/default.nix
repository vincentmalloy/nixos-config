{ inputs }: let
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
        config
        outputs.nixosModules.default
      ];
    };
}
