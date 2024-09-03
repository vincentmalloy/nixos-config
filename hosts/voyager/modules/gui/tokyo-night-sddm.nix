{ pkgs }:
# let
#   image = ../../../../../images/desktop/desktop_left.jpg;
# in
pkgs.stdenv.mkDerivation rec {
  name = "tokyo-night-sddm";
  version = "320c8e74";
  src = pkgs.fetchFromGitHub {
    owner = "siddrs";
    repo = "tokyo-night-sddm";
    rev = "320c8e74ade1e94f640708eee0b9a75a395697c6";
    sha256 = "JRVVzyefqR2L3UrEK2iWyhUKfPMUNUnfRZmwdz05wL0=";
  };
  dontBuild = true;
  installPhase = /* sh */ ''
    mkdir -p $out/share/sddm/themes
    cp -aR $src $out/share/sddm/themes/tokyo-night-sddm
  '';
    # cp ${image} $out/share/sddm/themes/tokyo-night-sddm/Backgrounds/voyager.jpg
}
