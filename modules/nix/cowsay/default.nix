{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.something.cowsay;
in {
  options.something.cowsay = {
    enable = mkEnableOption "cowsay test";
  };

  config = mkIf cfg.wnable {
    environment.systemPackages = [
      pkgs.cowsay
    ];
  };
}
