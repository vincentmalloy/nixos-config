{ pkgs, ... }:
{
  users.users.simon = {
    isNormalUser = true;
    description = "Simon Lundius";
    initialPassword = "1";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      nextcloud-client
      keepassxc
      neovim
    ];
  };
  # services.displayManager.autoLogin.enable = true;
  # services.displayManager.autoLogin.user = "simon";
}
