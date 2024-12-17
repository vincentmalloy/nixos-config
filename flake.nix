{
  description = "Nixos System Configuration";

  inputs = {
    # primary flake inputs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/x86_64-linux";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # neovim configuration module
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprland window manager
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
    };
    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
    };
    # theme
    stylix = {
      url = "github:danth/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    # spotify customisation
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # inputs for nixos on wsl2
    nixpkgs-wsl.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs-wsl";
    };
    home-manager-wsl = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-wsl";
    };
    nixvim-wsl = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs = {
        nixpkgs.follows = "nixpkgs-wsl";
        home-manager.follows = "home-manager-wsl";
      };
    };
    stylix-wsl = {
      url = "github:danth/stylix/cf8b6e2d4e8aca8ef14b839a906ab5eb98b08561";
      inputs = {
        nixpkgs.follows = "nixpkgs-wsl";
        home-manager.follows = "home-manager-wsl";
      };
    };

    # formatter
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {...}: let
    root = ./.;
    internal.lib = import ./lib {inherit inputs root;};
  in
    with internal.lib; {
      nixosConfigurations = {
        # voyager - home desktop
        voyager = mkNixosConfiguration {
          hostName = "voyager";
        };
        # voyager-wsl on home desktop
        voyager-wsl = mkNixosConfiguration {
          hostName = "voyager-wsl";
          wsl = true;
        };
      };

      nixosModules = {};

      homeModules = {};

      formatter = eachSystem (
        system:
          (inputs.treefmt-nix.lib.evalModule inputs.nixpkgs.legacyPackages.${system} ./treefmt.nix)
          .config
          .build
          .wrapper
      );
    };
}
