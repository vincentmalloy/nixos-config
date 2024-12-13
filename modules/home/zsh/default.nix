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
    shellAliases = let
      defaultNixPath = "/etc/nixos";
      flakeIsLinked = "[[ ( -h ${defaultNixPath} && -f $(readlink -f ${defaultNixPath}/flake.nix) ) ]]";
    in {
      # nixos rebuild
      nre =
        # zsh
        ''
          if ${flakeIsLinked}
          then
            sudo nixos-rebuild switch
          else
            echo "no flake linked to ${defaultNixPath}"
          fi
        '';
      nup =
        # zsh
        ''
          if ${flakeIsLinked}
          then
            cd $(readlink -f "${defaultNixPath}") && nix fmt && cd -
            nix flake update --flake $(readlink -f "${defaultNixPath}")
            sudo nixos-rebuild switch
          else
            echo "no flake linked to ${defaultNixPath}"
          fi
        '';
      nconf =
        # zsh
        ''
          if ${flakeIsLinked}
          then
            $EDITOR $(readlink -f "${defaultNixPath}")
          else
            echo "no flake linked to ${defaultNixPath}"
          fi
        '';
      gg = "git add .;git commit -m \"update\";git push";
      c = "clear";
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
