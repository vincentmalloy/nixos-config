{
  description = "nixos System configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/NUR";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    hyprpaper.url = "github:hyprwm/hyprpaper";
  };

  outputs = {...} @ inputs: let
    myLib = import ./lib/default.nix {inherit inputs;};
  in
    with myLib; {
      nixosConfigurations = {
        voyager = mkSystem "x86_64-linux" ./hosts/voyager; #======| VOYAGER - home desktop |=======#
      };

      nixosModules.default = ./modules/nix;
      homeManagerModules.default = ./modules/home;
      settings = ./settings.nix;

      formatter = inputs.nixpkgs.lib.genAttrs ["x86_64-linux"] (system: inputs.nixpkgs.legacyPackages.${system}.alejandra);
    };
}
