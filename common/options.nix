{lib, ...}: {
  options.settings = with lib; {
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
}
