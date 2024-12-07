{
  lib,
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
    ++ lib.optionals osConfig.settings.isWSL [
      "./targets/nixvim.nix"
    ];

  config = {
    stylix.enable = lib.mkDefault true;
  };
}
