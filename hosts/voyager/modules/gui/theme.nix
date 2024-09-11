{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
  ];
  stylix.image = ../../../../images/desktop/desktop_left.jpg;
}
