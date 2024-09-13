{lib, config, osConfig, pkgs, ...}:
with lib;
let
  cfg = config.bundles.vcs.git;
in {
  options.bundles.vcs.git = {
    enable = mkEnableOption "git package and configuration";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      package = pkgs.git;
      userName = "${osConfig.settings.fullName}";
      userEmail = "${osConfig.settings.githubId}+${osConfig.settings.githubUser}@users.noreply.github.com";
      aliases = {
        hist = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
        s = "status -sb";
        last = "log -1 HEAD --stat";
        c = "commit m";
        search = "!git rev-list --all | xargs git grep -F";
        dad = "!curl https://icanhazdadjoke.com/ && echo";
      };
    };
  };
}
