{lib, ...}: with lib;{
  imports = [
    ./vcs
    ./nixvim
    ./desktop
  ];

  config = {
    bundles = {
      vcs.enable = mkDefault true;
      desktop.enable = mkDefault true;
      nixvim.enable = mkDefault true;
    };

    manual = {
      html.enable = true;
      json.enable = true;
      manpages.enable = true;
    };
  };
}
