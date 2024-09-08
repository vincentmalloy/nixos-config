{
  pkgs,
  config,
  ...
}: {
  users.users.${config.username} = {
    isNormalUser = true;
    description = "${config.fullName}";
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
      neovim
    ];
  };
}
