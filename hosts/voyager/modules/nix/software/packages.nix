{pkgs, ...}: {
  # systemwide default packages
  environment.systemPackages = with pkgs; [
    vim
    git
    # bat
    fzf
    gnumake
    ripgrep
    wget
    gtop
    nix-prefetch-scripts
    bc
    aerc
    # blender
    p7zip
    openssl
    calcurse
    pass
  ];
}
