{lib, ...}: {
  options.settings = with lib; {
    diskoDevice = mkOption {
      description = "disk device used in disko configuration";
      type = with types; uniq str;
    };
    username = mkOption {
      description = "default system username";
      type = with types; uniq str;
    };
    fullName = mkOption {
      description = "default user full name";
      type = with types; uniq str;
    };
    githubUser = mkOption {
      description = "GitHub username";
      type = with types; uniq str;
    };
    githubId = mkOption {
      description = "GitHub user-ID";
      type = with types; uniq str;
    };
    colorscheme = mkOption {
      description = "colorscheme for nix-colors";
      type = with types; uniq str;
    };
  };
  
  imports = [
    ./hyprland
    ./stylix.nix
  ];

  config = with lib; {
    bundles.hyprland.enable = mkDefault true;
    bundles.stylix.enable = mkDefault true;
  };
}
