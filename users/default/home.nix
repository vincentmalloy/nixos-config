{
  lib,
  config,
  pkgs,
  inputs,
  settings,
  nur,
  ...
}:
{
  home = {
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
  };

  # imports = [
  #   ./modules/nixvim
  # ];

  home.packages = with pkgs; [
    jq
    gh
    librespot
    texliveFull
    inotify-tools
    nwg-look
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    EZA_COLORS = "da=38;5;240:sn=38;5;250:sb=38;5;240";
  };

  colorScheme = inputs.nix-colors.colorSchemes."${settings.colorscheme}";

  stylix = {
    enable = true;
    base16Scheme = config.colorScheme.palette;
    image = "${config.home.homeDirectory}/nixos-config/images/desktop/desktop_left.jpg";
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

  programs.git = {
    enable = true;
    userName = "${settings.fullName}";
    userEmail = "${settings.githubId}+${settings.githubUser}@users.noreply.github.com";
    aliases = {
      hist = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
      s = "status -sb";
      last = "log -1 HEAD --stat";
      c = "commit m";
      search = "!git rev-list --all | xargs git grep -F";
      dad = "!curl https://icanhazdadjoke.com/ && echo";
    };
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
    syntaxHighlighting.enable = true;
    shellAliases = {
      nup = "pushd ${config.home.homeDirectory}/nixos-config;./update.zsh;nix fmt;popd;sudo nixos-rebuild switch --upgrade --recreate-lock-file --flake ${config.home.homeDirectory}/nixos-config";
      nre = "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/nixos-config";
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
    # oh-my-zsh = {
    #   enable = true;
    #   theme = "agnoster";
    #   plugins = [
    #     "git"
    #     "history"
    #     "wd"
    #   ];
    # };
  };

  programs.oh-my-posh = let
    configFETCH = import ./fetch-omp-config.nix;
    configJSON = builtins.readFile (builtins.fetchurl configFETCH);
  in {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromJSON configJSON;
  };

  programs.helix = let
    themeslug = builtins.replaceStrings ["-"] ["_"] config.colorScheme.slug;
  in {
    enable = true;
    defaultEditor = true;
    settings = {
      # theme = "voyager";
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
    # themes = {
    #   voyager = {
    #     inherits = "${themeslug}";
    #     "ui.background" = {};
    #   };
    # };
  };

  programs.kitty = {
    enable = true;
    # font = {
    #   name = "CommitMono Nerd Font";
    #   size = 11;
    # };
    # # theme = "Monokai Soda";
    # settings = with config.colorScheme.palette; {
    #   background_opacity = "0.8";
    #   foreground = "#${base05}";
    #   background = "#${base00}";
    #   # black
    #   color0 = "#${base01}";
    #   color8 = "#${base03}";
    #   # red
    #   color1 = "#${base08}";
    #   color9 = "#${base08}";
    #   # green
    #   color2 = "#${base0B}";
    #   color10 = "#${base0B}";
    #   # yellow
    #   color3 = "#${base0A}";
    #   color11 = "#${base0A}";
    #   # blue
    #   color4 = "#${base0D}";
    #   color12 = "#${base0D}";
    #   # magenta
    #   color5 = "#${base0E}";
    #   color13 = "#${base0E}";
    #   # cyan
    #   color6 = "#${base0C}";
    #   color14 = "#${base0C}";
    #   # white
    #   color7 = "#${base05}";
    #   color15 = "#${base07}";
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
        extensions = with nur.repos.rycee.firefox-addons; [
          ublock-origin
        ];
      };
    };
  };

  # gtk = let nix-colors-lib = inputs.nix-colors.lib.contrib {inherit pkgs; }; in{
  #   enable = true;
  #   theme = {
  #     package = nix-colors-lib.gtkThemeFromScheme {
  #       scheme = config.colorScheme;
  #     };
  #     name = "generated-gtk-theme-${config.colorScheme.slug}";
  #   };
  #   gtk3.extraConfig = {
  #     settings = ''
  #       gtk-application-prefer-dark-theme = 1;
  #     '';
  #   };
  #   gtk4.extraConfig = {
  #     settings = ''
  #       gtk-application-prefer-dark-theme = 1;
  #     '';
  #   };
  # };
}
