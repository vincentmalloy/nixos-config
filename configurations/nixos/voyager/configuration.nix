{
  inputs,
  config,
  homeModules,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.disko.nixosModules.default
    (import ./disko.nix {device = "/dev/nvme0n1";})
    ./includes
  ];

  internal.modules.hardware.nvidia.enable = true;

  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.05";
}
