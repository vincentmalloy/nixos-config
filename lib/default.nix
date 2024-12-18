{
  inputs,
  root,
}: let
  settings = import (root + /settings.nix);
in {
  mkNixosConfiguration = {
    hostName,
    home-manager ? true,
    system ? "x86_64-linux",
    wsl ? false,
    modules ? [],
    args ? {},
  }: let
    type =
      if wsl
      then "-wsl"
      else "";
    nixpkgs = inputs."nixpkgs${type}";
    specialArgs = {
      inherit inputs root;
      myLib = {
        isWSL = config: (
          if (builtins.hasAttr "wsl" config)
          then
            config.wsl.enable
          else
            false
        );
      };
    } // args;
    additionalModules = with nixpkgs.lib; (
      modules
      ++ optionals home-manager [
        inputs."home-manager${type}".nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.sharedModules = [
            (root + /modules/settings)
          ];
        }
      ]
      ++ optionals wsl [
        inputs.nixos-wsl.nixosModules.wsl
      ]
      ++ optionals (!wsl) [
        inputs.nur.modules.nixos.default
      ]
    );
  in
    nixpkgs.lib.nixosSystem {
      inherit system specialArgs;
      modules =
        [
          {networking.hostName = hostName;}
          (root + /modules/settings)
          (root + /hosts/${hostName}/configuration.nix)
          inputs."stylix${type}".nixosModules.stylix
          (root + /modules/nix)
          inputs.nur.modules.nixos.default
        ]
        ++ additionalModules;
    };

  # tool to iterate over each systems
  eachSystem = inputs.nixpkgs.lib.genAttrs (import inputs.systems);
}
