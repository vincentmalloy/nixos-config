{...}: {
  nix = {
    settings = {
      warn-dirty = false;
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
      trusted-users = ["wheel"];
    };
    # garbage-collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    # store optimization
    optimise = {
      automatic = true;
    };
  };
  nixpkgs.config.allowUnfree = true;
}
