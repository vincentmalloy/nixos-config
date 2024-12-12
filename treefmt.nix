{ ... }:
{
  projectRootFile = "flake.nix";
  settings = {
    verbose = 0;
    excludes = [
      "*.lock"
      "Makefile"
    ];
  };
  programs.nixfmt.enable = true;
  # programs.alejandra.enable = true;
}
