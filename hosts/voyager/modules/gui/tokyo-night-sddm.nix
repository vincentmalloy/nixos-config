{ pkgs }:
let
  image = ../../../../../images/desktop/desktop_left.jpg;
in
pkgs.stdenv.mkDerivation {
  name = "tokyo-night-sddm.nix";
  src = pkgs.fetchFromGithub {
    owner = "siddrs";
    repo = "tokyo-night-sddm";
    rev = "320c8e74ade1e94f640708eee0b9a75a395697c6";
    sha256 = "JRVVzyefqR2L3UrEK2iWyhUKfPMUNUnfRZmwdz05wL0=";
  };
  installPhase = /* sh */ ''
    mkdir -p $out/share/sddm/themes
    cp -AR $src $out/share/sddm/themes/tokyo-night-sddm
    cp ${image} $out/share/sddm/themes/tokyo-night-sddm/Backgrounds/voyager.jpg
  '';
}
