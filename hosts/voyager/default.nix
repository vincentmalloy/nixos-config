{ inputs, ...}: {
  config.settings = {
    username = "simon";
    fullName = "Simon Lundius";
    githubUser = "vincentmalloy";
    githubId = "25029432";
    # colorscheme = "monokai";
    # colorscheme = "classic-dark";
    colorscheme = "gruvbox-dark-hard";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  config.system.stateVersion = "24.05"; # Did you read the comment?

  imports = [
    inputs.disko.nixosModules.default
    (import ./disko-config.nix {device = "/dev/nvme0n1";})
    inputs.home-manager.nixosModules.home-manager
    inputs.stylix.nixosModules.stylix
    inputs.nur.nixosModules.nur
    ./home-manager-config.nix
    ./configuration.nix
  ];
}
