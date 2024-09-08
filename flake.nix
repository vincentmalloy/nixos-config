{
  description = "nixos System configurations";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors = {
      url = "github:misterio77/nix-colors";
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

  outputs = {
    self,
    nixpkgs,
    disko,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # supported systems
    systems = [
      "x86_64-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    nixosConfigurations = {
      # voyager - home desktop
      voyager = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common
          disko.nixosModules.default
          (import ./hosts/voyager/disko-config.nix {device = "/dev/nvme0n1";})
          home-manager.nixosModules.home-manager
          ./common
          ./hosts/voyager
          # ./hosts/voyager/home-manager-config.nix
          # ./hosts/voyager/configuration.nix
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };

    # formatter
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
  };
}
