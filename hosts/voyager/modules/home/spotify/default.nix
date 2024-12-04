{
  lib,
  osConfig,
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      librespot
    ];
  };

  # authentication:
  # librespot -c ~/.cache/spotify-player -b 320
  # connect to device from player (e.g. on phone). credentials will be saved
  # then start spotify_player
  programs.spotify-player = {
    enable = true;
    settings = {
      notify_timeout_in_secs = 2;
    };
  };
}
