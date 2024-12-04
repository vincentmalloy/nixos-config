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
    isWSL = mkOption {
      description = "config is for a WSL installation";
      type = with types; bool;
      default = false;
    };
    enableGui = mkEnableOption {
      description = "enable Graphical user interface tools and programs";
      type = with types; bool;
      default = false;
    };
  };

  imports = [
    ./user
    ./stylix
    ./settings
    ./system
  ];

  config = with lib; {
    settings = mkDefault (import ../../settings.nix);
  };
}
