{inputs}: let
  # supported systems
  systems = ["x86_64-linux"];
in {
  # generate nixosConfiguration for a system with a given hostname
  mkSystem = hostName: {
    system ? "x86_64-linux",
    wsl ? false,
    modules ? [],
    args ? {},
  }: let
    specialArgs = {inherit inputs;} // args;
    input-suffix =
      if wsl
      then "-wsl"
      else "";
    additionalModules =
      modules
      ++ inputs.nixpkgs.lib.optionals wsl [
        inputs.nixos-wsl.nixosModules.wsl
        ({...}: {settings.isWSL = true;})
      ];
  in
    inputs."nixpkgs${input-suffix}".lib.nixosSystem {
      inherit system;
      inherit specialArgs;
      modules =
        [
          ../hosts/${hostName}/configuration.nix
          inputs.nur.modules.nixos.default
          inputs."stylix${input-suffix}".nixosModules.stylix
          inputs."home-manager${input-suffix}".nixosModules.home-manager
          ({...}: {networking.hostName = hostName;})
          ../modules/nix
        ]
        ++ additionalModules;
    };

  # tool to iterate over each systems
  eachSystem = inputs.nixpkgs.lib.genAttrs systems;
}
