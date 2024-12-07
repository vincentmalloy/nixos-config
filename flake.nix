{
  description = "Nixos System Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nixvim.url = "github:nix-community/nixvim";
    stylix.url = "github:danth/stylix";

    nixpkgs-wsl.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager-wsl.url = "github:nix-community/home-manager/release-24.05";
    nixvim-wsl.url = "github:nix-community/nixvim/nixos-24.05";
    stylix-wsl.url = "github:danth/stylix/release-24.05";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs-wsl";
    };

    nur.url = "github:nix-community/NUR";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpaper.url = "github:hyprwm/hyprpaper";
  };

  outputs = inputs @ {...}: let
    internal.lib = import ./lib {inherit inputs;};
  in
    with internal.lib; {
      nixosConfigurations = {
        # voyager - home desktop
        voyager = mkSystem "voyager" {modules = [inputs.nur.modules.nixos.default];};
        # voyager2 - wsl on home desktop
        voyager2 = mkSystem "voyager2" {wsl = true;};
      };

      formatter = eachSystem (
        system:
          (inputs.treefmt-nix.lib.evalModule inputs.nixpkgs.legacyPackages.${system} ./treefmt.nix)
          .config
          .build
          .wrapper
      );
    };
}
