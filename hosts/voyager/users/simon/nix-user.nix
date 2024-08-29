{ pkgs, ... }:
{
  users.users.simon = {
    isNormalUser = true;
    description = "Simon Lundius";
    initialPassword = "1";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      nextcloud-client
      keepassxc
      neovim
    ];
  };
}
