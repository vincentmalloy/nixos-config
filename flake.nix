{
  description = "Nixos System Configuration";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-wsl.url = "github:nixos/nixpkgs/nixos-24.05";
    # set default nixpkgs
    nixpkgs.follows = "nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    nixvim.url = "github:nix-community/nixvim";
    stylix.url = "github:danth/stylix";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs-wsl";
    };
    home-manager-wsl.url = "github:nix-community/home-manager/release-24.05";
    nixvim-wsl.url = "github:nix-community/nixvim/nixos-24.05";
    stylix-wsl.url = "github:danth/stylix/release-24.05";

    disko.url = "github:nix-community/disko";
    nur.url = "github:nix-community/NUR";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprpaper.url = "github:hyprwm/hyprpaper";
  };

  outputs = inputs @ {...}: let
    internal.lib = import ./lib {inherit inputs;};
  in
    with internal.lib; {
      nixosConfigurations = {
        # voyager - home desktop
        voyager = mkSystem "voyager" {};
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
