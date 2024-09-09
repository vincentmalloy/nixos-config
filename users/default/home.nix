{
  lib,
  config,
  pkgs,
  inputs,
  settings,
  ...
}: let
  nix-colors-lib = inputs.nix-colors.lib.contrib {inherit pkgs;};
in {
  home = {
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
  };

  home.packages = with pkgs; [
    helix
    jq
    gh
    librespot
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    EZA_COLORS = "da=38;5;240:sn=38;5;250:sb=38;5;240";
  };

  colorScheme = inputs.nix-colors.colorSchemes."${settings.colorscheme}";

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

  programs.nixvim = let
    nix-colors-lib = inputs.nix-colors.lib.contrib {inherit pkgs;};
  in {
    enable = true;
    globals.mapleader = " ";
    globals.transparent_enabled = true;
    viAlias = true;
    vimAlias = true;
    colorscheme = "nix-${config.colorScheme.slug}";
    plugins = {
      lualine = {
        enable = true;
      };
      telescope = {
        enable = true;
      };
      neo-tree = {
        enable = true;
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      transparent-nvim
      (nix-colors-lib.vimThemeFromScheme {scheme = config.colorScheme;})
    ];
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>e";
        action = "<cmd>Neotree toggle<cr>";
        options = {desc = "Open/Close Neotree";};
      }
    ];
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

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "voyager";
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
    themes = {
      voyager = {
        inherits = "molokai";
        "ui.background" = {};
      };
    };
  };

  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window = {
      opacity = 0.5;
    };
    font = {
      normal = {
        family = "CommitMono Nerd Font";
        style = "Regular";
      };
    };
    colors = with config.colorScheme.palette; {
      bright = {
        black = "0x${base00}";
        blue = "0x${base0D}";
        cyan = "0x${base0C}";
        green = "0x${base0B}";
        magenta = "0x${base0E}";
        red = "0x${base08}";
        white = "0x${base06}";
        yellow = "0x${base09}";
      };
      cursor = {
        cursor = "0x${base06}";
        text = "0x${base06}";
      };
      normal = {
        black = "0x${base00}";
        blue = "0x${base0D}";
        cyan = "0x${base0C}";
        green = "0x${base0B}";
        magenta = "0x${base0E}";
        red = "0x${base08}";
        white = "0x${base06}";
        yellow = "0x${base0A}";
      };
      primary = {
        background = "0x${base00}";
        foreground = "0x${base06}";
      };
    };
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "CommitMono Nerd Font";
      size = 11;
    };
    theme = "Monokai Soda";
    settings = {
      background_opacity = "0.5";
      foreground = "#${config.colorScheme.palette.base05}";
      background = "#${config.colorScheme.palette.base00}";
      # background = "#000000";
    };
  };

  programs.firefox = {
    enable = true;
  };

  gtk = {
    enable = true;
    gtk3.extraConfig = {
      settings = ''
        gtk-application-prefer-dark-theme = 1;
      '';
    };
    gtk4.extraConfig = {
      settings = ''
        gtk-application-prefer-dark-theme = 1;
      '';
    };
  };
}
