{
  pkgs,
  config,
  root,
  ...
}: let
  tokyo-night-sddm = pkgs.libsForQt5.callPackage ./tokyo-night-sddm.nix {inherit pkgs config root;};
in {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    wayland.compositor = "kwin";
    theme = "tokyo-night-sddm";
  };
  environment.systemPackages = [
    pkgs.libsForQt5.qtgraphicaleffects
    tokyo-night-sddm
  ];
}
