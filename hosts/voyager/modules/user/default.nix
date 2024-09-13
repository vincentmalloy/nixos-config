{
  pkgs,
  config,
  ...
}: {
  users.users.${config.settings.username} = {
    isNormalUser = true;
    description = "${config.settings.fullName}";
    initialPassword = "1";
    extraGroups = [
      "networkmanager"
      "wheel"
      "keys"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      nextcloud-client
      keepassxc
    ];
  };
  services.displayManager.autoLogin = {
    enable = true;
    user = config.settings.username;
  };
  security.sudo.wheelNeedsPassword = false;
}
