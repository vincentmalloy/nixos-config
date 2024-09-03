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

  programs.git = {
    enable = true;
    userName = "Simon Lundius";
    userEmail = "25029432+vincentmalloy@users.noreply.github.com";
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
    };
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

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    # TODO: move this somewhere it can be accessed externally
    settings = builtins.fromJSON(''
 
    {
      "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
      "blocks": [
        {
          "alignment": "left",
          "segments": [
            {
              "background": "p:os-win",
              "background_templates": [
                "{{ if .WSL }}p:os-linux{{ end }}"
              ],
              "foreground": "p:dark",
              "foreground_templates": [
                "{{ if .WSL }}p:foreground{{ end }}"
              ],
              "properties": {
                "windows": ""
              },
              "style": "plain",
              "template": " {{.Icon}}",
              "type": "os"
            },
            {
              "background": "p:os-win",
              "background-templates": [
                "{{ if .WSL }}p:os-linux{{ end }}"
              ],
              "foreground": "p:dark",
              "foreground_templates": [
                "{{ if .WSL }}p:foreground{{ end }}"
              ],
              "properties": {
                "mapped_shell_names": {
                  "pwsh": "󰨊"
                }
              },
              "style": "diamond",
              "template": " {{ .Name }} ",
              "trailing_diamond": "",
              "type": "shell"
            },
            {
              "alias": "RootStatus",
              "background": "p:background",
              "background_templates": [
                "{{ if .Root }}p:red{{ end }}"
              ],
              "foreground": "p:foreground",
              "foreground_templates": [
                "{{ if .Root }}p:yellow{{ end }}"
              ],
              "style": "diamond",
              "template": "{{ if .Root }}{{ else }} {{ end }} ",
              "trailing_diamond": "",
              "type": "text"
            },
            {
              "background": "p:background",
              "background_templates": [
                "{{ if not .Writable }}p:red{{ end }}"
              ],
              "foreground": "p:foreground",
              "properties": {
                "folder_icon": "",
                "folder_separator_icon": " <transparent></> ",
                "home_icon": "󰋜",
                "mapped_locations": {
                  "C:\\Temp": "󱕖8"
                },
                "max_depth": 3,
                "style": "agnoster_short"
              },
              "style": "diamond",
              "template": " {{ .Path }} ",
              "type": "path"
            },
            {
              "background": "p:green",
              "background_templates": [
                "{{ if or (.Working.Changed) (.Staging.Changed) }}p:yellow{{ end }}",
                "{{ if and (gt .Ahead 0) (gt .Behind 0) }}#FFCC80{{ end }}",
                "{{ if gt .Ahead 0 }}#B388FF{{ end }}",
                "{{ if gt .Behind 0 }}#B388FF{{ end }}"
              ],
              "foreground": "p:dark",
              "leading_diamond": "<parentBackground,background></>",
              "properties": {
                "fetch_stash_count": true,
                "fetch_status": true
              },
              "style": "diamond",
              "template": " {{ .UpstreamIcon }}{{ trunc 30 .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }} 󰤌 {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }} 󰄵 {{ .Staging.String }}{{ end }}{{ if gt .StashCount 0 }}  {{ .StashCount }}{{ end }} ",
              "type": "git"
            },
            {
              "background": "p:grey",
              "foreground": "p:dark",
              "leading_diamond": "<parentBackground,background></>",
              "properties": {
                "style": "dallas",
                "threshold": 500
              },
              "style": "diamond",
              "template": " {{ .FormattedMs }}s ",
              "type": "executiontime"
            },
            {
              "background": "p:red",
              "foreground": "p:light",
              "powerline_symbol": "",
              "properties": {
                "always_enabled": true
              },
              "style": "plain",
              "template": "{{ if gt .Code 0 }}<parentBackground,background></><transparent> </> {{ .Meaning }} <background,transparent></>{{ else }}<parentBackground,transparent></>{{ end }}",
              "type": "status"
            }
          ],
          "type": "prompt"
        },
        {
          "alignment": "right",
          "segments": [
            {
              "background": "transparent",
              "foreground": "p:light",
              "style": "plain",
              "template": "[{{ if .SSHSession }} {{ end }}<d>{{ .UserName }}</d>]@[<d>{{ .HostName }}</d>]  ",
              "type": "session"
            },
            {
              "background": "p:bgcycle1",
              "foreground": "p:foreground",
              "powerline_symbol": "",
              "properties": {
                "time_format": "󰃭 02/01/2006 - 15:04:05"
              },
              "style": "powerline",
              "template": " {{ .CurrentDate | date .Format }} ",
              "type": "time"
            },
            {
              "background": "p:bgcycle2",
              "foreground": "p:foreground",
              "powerline_symbol": "",
              "properties": {
                "api_key": "f357dab7a75033a9381f40bf7a1cfe1f",
                "cache_timeout": 10,
                "http_timeout": 500,
                "location": "IDAR-OBERSTEIN,DE",
                "units": "metric"
              },
              "style": "powerline",
              "template": "{{.Weather}} {{.Temperature}}{{.UnitIcon}} ",
              "type": "owm"
            },
            {
              "background": "p:bgcycle3",
              "background_templates": [
                "{{ if and (not (eq .Type \"wifi\")) (not (eq .Type \"ethernet\")) }}p:red{{ end }}"
              ],
              "foreground": "p:foreground",
              "powerline_symbol": "",
              "style": "powerline",
              "template": " {{ if eq .Type \"wifi\"}} {{ .SSID }}{{ else if eq .Type \"ethernet\"}}󰛳 {{ else }}󰲛 {{ end }} ",
              "type": "connection"
            },
            {
              "alias": "ram",
              "background": "p:bgcycle5",
              "background_templates": [
                "{{ if lt .PhysicalPercentUsed 50 }}p:green{{ end }}",
                "{{ if gt .PhysicalPercentUsed 90 }}p:red{{ end }}"
              ],
              "foreground": "p:foreground",
              "foreground_templates": [
                "{{ if lt .PhysicalPercentUsed 50 }}p:dark{{ end }}"
              ],
              "powerline_symbol": "",
              "properties": {
                "precision": 2
              },
              "style": "powerline",
              "template": " 󰘚 {{ round .PhysicalPercentUsed .Precision }}% ",
              "type": "sysinfo"
            },
            {
              "background": "p:background",
              "background_templates": [
                "{{if eq \"Charging\" .State.String}}p:blue{{end}}",
                "{{if eq \"Discharging\" .State.String}}{{ if lt .Percentage 25 }}p:red{{ else if lt .Percentage 50 }}p:orange{{ else if lt .Percentage 75 }}p:yellow{{ else }}p:dark{{ end }}{{end}}",
                "{{if eq \"Full\" .State.String}}p:green{{end}}"
              ],
              "foreground": "p:foreground",
              "foreground_templates": [
                "{{if eq \"Charging\" .State.String}}p:dark{{end}}",
                "{{if eq \"Discharging\" .State.String}}{{ if lt .Percentage 25 }}p:foreground{{ else if lt .Percentage 50 }}p:foreground{{ else if lt .Percentage 75 }}p:dark{{ else }}p:foreground{{ end }}{{end}}",
                "{{if eq \"Full\" .State.String}}p:dark{{end}}"
              ],
              "leading_diamond": "",
              "properties": {
                "charged_icon": "󱟢",
                "charging_icon": "󱟠",
                "discharging_icon": "󱟞"
              },
              "style": "diamond",
              "template": " {{ if not .Error }}{{ .Icon }}{{ if lt .Percentage 90  }}{{ .Percentage }} {{ end }}{{ end }} ",
              "type": "battery"
            }
          ],
          "type": "prompt"
        },
        {
          "alignment": "left",
          "newline": true,
          "segments": [
            {
              "foreground": "p:light",
              "style": "plain",
              "template": "#❯",
              "type": "text"
            }
          ],
          "type": "prompt"
        }
      ],
      "console_title_template": "{{if .Root}} ⚡ {{end}}{{.Folder | replace \"~\" \"󰋜\" }} @ {{.HostName}}",
      "palette": {
        "background": "p:dark",
        "bgcycle1": "#202020",
        "bgcycle2": "#232323",
        "bgcycle3": "#262626",
        "bgcycle4": "#292929",
        "bgcycle5": "#2c2c2c",
        "bgcycle6": "#2f2f2f",
        "bgcycle7": "#323232",
        "blue": "#0000ed",
        "dark": "#2a2a2a",
        "foreground": "p:light",
        "green": "#00c853",
        "grey": "#8a8a8a",
        "light": "#cacaca",
        "orange": "#e95420",
        "os-linux": "#e95420",
        "os-win": "#01a6f0",
        "red": "#910000",
        "yellow": "#ffeb3b"
      },
      "secondary_prompt": {
        "background": "transparent",
        "foreground": "p:light",
        "interactive": true,
        "template": "<d> ❯</>"
      },
      "transient_prompt": {
        "background": "transparent",
        "foreground": "#ffffff",
        "template": "<d>-❯</>"
      },
      "version": 2
    }
    '');
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

    # profiles.default = {
    #   extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
    #       darkreader
    #       i-dont-care-about-cookies
    #       ublock-origin
    #       youtube-shorts-block
    #       keepassxc-browser
    #   ];
    #   extraConfig = ''
    #     user_pref("extensions.autoDisableScopes", 0);
    #     user_pref("extensions.enabledScopes", 15);
    #   '';
    # };
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

  home.packages = with pkgs; [
    helix
  ];
}
