{ pkgs, ... }:
{
  # default systemwide packages
  environment.systemPackages = with pkgs; [
    git
    vim
    gnumake
  ];
}
