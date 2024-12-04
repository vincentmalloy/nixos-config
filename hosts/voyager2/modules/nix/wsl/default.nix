{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
  ];

  config = {
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
