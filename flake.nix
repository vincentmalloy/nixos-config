{
  description = "nixos System configurations";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };
    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
    };
  };

  outputs = { ... } @ inputs: let
    myLib = import ./lib/default.nix {inherit inputs;};
    # defaultModules = [
    #   ./globalSettings.nix
    #   ./common/nix
    # ];
    # forAllSystems = nixpkgs.lib.genAttrs systems;
  in 
    with myLib; {
      nixosConfigurations = {
        voyager = mkSystem "x86_64-linux" ./hosts/voyager;# voyager - home desktop
      # see settings in hosts/voyager/default.nix
      # voyager = nixpkgs.lib.nixosSystem {
      #   system = "x86_64-linux";
      #   modules =
      #     [
      #       ./hosts/voyager
      #     ]
      #     ++ defaultModules;
      #   specialArgs = {
      #     inherit inputs;
      #   };
      # };
      };

    formatter = forAllSystems (nixpkgs.alejandra);

    nixosModules.default = [
      ./globalSettings.nix
      ./common/nix
    ];

    # formatter
    # formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
  };
}
