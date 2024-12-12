{
  config,
  pkgs,
  ...
}:
{
  programs.zsh.enable = true;
  users.users.${config.settings.username} = {
    isNormalUser = true;
    description = "${config.settings.fullName}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "keys"
      "input"
    ];
    shell = pkgs.zsh;
  };
  nix.settings.trusted-users = [ "${config.settings.username}" ];
  security.sudo.wheelNeedsPassword = false;
}
