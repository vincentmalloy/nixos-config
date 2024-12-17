{
  inputs,
  root,
}: {
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
    specialArgs = {inherit inputs;} // args;
    additionalModules = (
      modules
      ++ nixpkgs.lib.optionals home-manager [
        inputs."home-manager${type}".nixosModules.home-manager
      ]
      ++ nixpkgs.lib.optionals wsl [
        inputs.nixos-wsl.nixosModules.wsl
        {settings.isWSL = true;}
      ]
      ++ nixpkgs.lib.optionals (!wsl) [
        inputs.nur.modules.nixos.default
      ]
    );
  in
    nixpkgs.lib.nixosSystem {
      inherit system specialArgs;
      modules =
        [
          {networking.hostName = hostName;}
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
