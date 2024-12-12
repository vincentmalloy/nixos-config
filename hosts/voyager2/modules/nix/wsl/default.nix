{
  inputs,
  pkgs,
  config,
  ...
}:
{
  imports = [
  ];

  config = {
    environment.variables = {
      WSL_WIN_HOME_PATH = "/mnt/c/Users/${config.settings.username}";
    };
    wsl = {
      enable = true;
      wslConf.automount.root = "/mnt";
      wslConf.interop.appendWindowsPath = false;
      wslConf.network.generateHosts = false;
      defaultUser = "${config.settings.username}";
      startMenuLaunchers = true;

      # Enable integration with Docker Desktop (needs to be installed)
      docker-desktop.enable = false;
    };
  };
}
