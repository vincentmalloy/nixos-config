{
  osConfig,
  config,
  ...
}: {
  # TODO: zsh settings
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    autocd = true;
    syntaxHighlighting.enable = true;
    history = {
      ignoreAllDups = true;
    };
    shellAliases = {
      nup = "pushd ${config.home.homeDirectory}/nixos-config;make update;popd";
      nre = "pushd ${config.home.homeDirectory}/nixos-config;make;popd";
      gg = "git add .;git commit -m \"update\";git push";
      c = "clear";
      enix = "nvim ${config.home.homeDirectory}/nixos-config";
      caldav = "CALCURSE_CALDAV_PASSWORD=$(keepassxc-cli show -sa password ~/Nextcloud/Passwords/Passwords_Personal.kdbx \"web/hosting/things remote cloud\") calcurse-caldav";
    };
    initExtra =
      # zsh
      ''
        # git shorthand
        # no args: git status, with args: git
        g() {
          if [[ $# -gt 0 ]]; then
            git "$@"
          else
            git status -sb
          fi
        }
        # gitignore.io
        function gi() {
          curl -sLw "\n" https://toptal.com/developers/gitignore/api/$@;
        }

        # run commonly used cli tools
        run() {
          programs=("aerc - mail client" "gtop - resource monitor" "spotify_player" "cava - audio visualizer")
          select program in $programs; do
            case $program in
              "aerc"*)
                aerc
                break
                ;;
              "gtop"*)
                gtop
                break
                ;;
              *) echo "abort";break;;
            esac
          done
        }
      '';
  };
}
