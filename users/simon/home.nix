{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
{

  home = {
    username = lib.mkDefault "simon";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
  };

  home.packages = with pkgs; [
    helix
    jq
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    EZA_COLORS = "da=38;5;240:sn=38;5;250:sb=38;5;240";
  };

  programs.git = {
    enable = true;
    userName = "Simon Lundius";
    userEmail = "25029432+vincentmalloy@users.noreply.github.com";
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
      nup = "sudo nixos-rebuild switch --upgrade --recreate-lock-file --flake ${config.home.homeDirectory}/nixos-config";
      nre = "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/nixos-config";
      testomp = "oh-my-posh print primary --config ${config.home.homeDirectory}/oh-my-posh-config/config.json --shell uni";
    };
    initExtra = /* zsh */ ''
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
  configJSON = builtins.readFile ( builtins.fetchurl (configFETCH));
  in {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromJSON (configJSON);
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
        rulers = [ 120 ];
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
        "ui.background" = { };
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
      background = "#000000";
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
