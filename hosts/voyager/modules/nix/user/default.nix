{
  pkgs,
  config,
  ...
}:
{
  users.users.${config.settings.username} = {
    initialPassword = "1";
    packages = with pkgs; [
      nextcloud-client
      keepassxc
    ];
  };
  services.displayManager.autoLogin = {
    enable = true;
    user = config.settings.username;
  };
}
