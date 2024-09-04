{ pkgs, ... }:
{
  # systemwide default packages
  environment.systemPackages = with pkgs; [
    vim
    git
    bat
    fzf
    gnumake
    ripgrep
    wget
    nix-prefetch-scripts
  ];
}
