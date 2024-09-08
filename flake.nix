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
        specialArgs = {
          inherit inputs;
        };
        system = "x86_64-linux";
        # username = "simon";
        # hostname = "voyager";
        modules = [
          disko.nixosModules.default
          (import ./hosts/voyager/disko-config.nix {device = "/dev/nvme0n1";})
          home-manager.nixosModules.home-manager
          (import ./hosts/voyager/home-manager-config.nix {})
          # {
          #   home-manager.useGlobalPkgs = true;
          #   home-manager.useUserPackages = true;
          #   home-manager.backupFileExtension = "backup";
          #   home-manager.users.simon = {imports = [./users/simon ./hosts/voyager/users/simon/home.nix];};
          #   home-manager.extraSpecialArgs = {
          #     inherit inputs;
          #   };
          # }
          ./common
          ./hosts/voyager/configuration.nix
        ];
      };
    };

    # formatter
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
  };
}
