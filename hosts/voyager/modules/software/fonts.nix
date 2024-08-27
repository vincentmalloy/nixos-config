{ ... }:
{
  fonts.packages = with pkgs; [
    font-awesome
    commit-mono

    (nerdfonts.override { fonts = [ "CommitMono" ]; })
  ];
}