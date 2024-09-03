{ pkgs }:
pkgs.stdenv.mkDerivation rec {
  name = "sddm-astronaut-theme";
  version = "48ea0a79";
  src = pkgs.fetchFromGitHub {
    owner = "Keyitdev";
    repo = "sddm-astronaut-theme";
    rev = "48ea0a792711ac0c58cc74f7a03e2e7ba3dc2ac0";
    sha256 = "kXovz813BS+Mtbk6+nNNdnluwp/7V2e3KJLuIfiWRD0=";
  };
  dontBuild = true;
  installPhase = /* sh */ ''
    mkdir -p $out/share/sddm/themes
    cp -aR $src $out/share/sddm/themes/sddm-astronaut-theme
  '';
}
