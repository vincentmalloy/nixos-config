{
  lib,
  myLib,
  osConfig,
  ...
}: {
  imports = [
    ./stylix.nix
    ./targets
  ];

  disabledModules =
    [
    ]
    ++ lib.optionals (myLib.isWSL osConfig) [
      ./targets/nixvim.nix
      ./targets/spicetify.nix
    ];

  config = {
    stylix.enable = lib.mkDefault true;
  };
}
