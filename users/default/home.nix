{
  lib,
  config,
  pkgs,
  inputs,
  osConfig,
  ...
}: {
  home = {
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
  };

  home.packages = with pkgs; [
    jq
    librespot
    texliveFull
    inotify-tools
    nwg-look
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    EZA_COLORS = "da=38;5;240:sn=38;5;250:sb=38;5;240";
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

  programs.zathura = {
    enable = true;
  };

  programs.cava = {
    enable = true;
  };

  programs.eza = {
    enable = true;
    icons = true;
    extraOptions = [
      "--group-directories-first"
    ];
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    autocd = true;
    syntaxHighlighting.enable = true;
    history = {
      ignoreAllDups = true;
    };
    shellAliases = {
      nup = "pushd ${config.home.homeDirectory}/nixos-config;./update.zsh;nix fmt;popd;sudo nixos-rebuild switch --upgrade --recreate-lock-file --flake ${config.home.homeDirectory}/nixos-config";
      nre = "pushd ${config.home.homeDirectory}/nixos-config;make;popd";
      testomp = "oh-my-posh print primary --config ${config.home.homeDirectory}/oh-my-posh-config/config.json --shell uni";
      gg = "git add .;git commit -m \"update\";git push";
      c = "clear";
      enix = "nvim ${config.home.homeDirectory}/nixos-config";
    };
    initExtra =
      /*
      zsh
      */
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
      '';
  };

  programs.oh-my-posh = let
    configFETCH = import ./fetch-omp-config.nix;
    configJSON = builtins.readFile (builtins.fetchurl configFETCH);
  in {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromJSON configJSON;
  };

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor = {
        true-color = true;
        bufferline = "multiple";
        cursorline = true;
        rulers = [120];
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides = {
          render = true;
        };
      };
    };
  };

  programs.kitty = {
    enable = true;
    # keybindings = {
    # };
    extraConfig = ''
      modify_font cell_height 110%
    '';
  };

  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "about:blank";
          "browser.display.use_system_colors" = true;
          "browser.display.background_color.dark" = config.lib.stylix.colors.withHashtag.base00;
        };
        extensions = with osConfig.nur.repos.rycee.firefox-addons; [
          ublock-origin
          keepassxc-browser
        ];
      };
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.gruvbox-dark-icons-gtk;
      name = "gruvbox-dark-gtk";
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
