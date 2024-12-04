{
  lib,
  config,
  osConfig,
  pkgs,
  ...
}: {
  config = {
    programs.git = {
      enable = true;
      userName = "${osConfig.settings.fullName}";
      userEmail = "${osConfig.settings.githubId}+${osConfig.settings.githubUser}@users.noreply.github.com";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
      aliases = {
        hist = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
        s = "status -sb";
        last = "log -1 HEAD --stat";
        c = "commit m";
        search = "!git rev-list --all | xargs git grep -F";
        dad = "!curl https://icanhazdadjoke.com/ && echo";
      };
      ignores = [
        "*__pycache__*"
        ".direnv"
      ];
    };
    # github cli
    programs.gh = {
      enable = true;
    };
  };
}
