{...}: {
  projectRootFile = "flake.nix";
  settings = {
    verbose = 0;
    excludes = [
      "*.lock"
      "Makefile"
    ];
  };
  programs.alejandra.enable = true;
}
