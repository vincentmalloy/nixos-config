{
  pkgs,
  lib,
  ...
}: let
  name = "cheatsheet";
  scriptName = name;
  workspaceName = name;

  toggleKey = "H";

  cheatsheets = {
    kitty = {
      patternSets = [
        {
          title = "nvim";
          patterns = [
            "nvim"
            "vim"
            "vi"
            "nconf"
          ];
        }
      ];
    };
  };

  patternScript = lib.concatStringsSep "\n" [
    "case $initial_title in"
    (
      lib.concatStringsSep "\n" (
        lib.mapAttrsToList (
          initialTitle: infoset: (
            lib.concatStringsSep "\n" [
              (initialTitle + ")")
              (
                if builtins.pathExists (./cheatsheets + "/${initialTitle}.md")
                then "cheatsheet='${(builtins.readFile (./cheatsheets + "/${initialTitle}.md"))}'"
                else "cheatsheet='no file exists for ${initialTitle}'"
              )
              (lib.concatStringsSep "\n" (
                lib.lists.map (
                  patternSet:
                    lib.concatStringsSep "\n" [
                      ("for pattern in " + (lib.concatStringsSep " " patternSet.patterns))
                      "do"
                      "pattern=\"^$pattern(\\s.*)?$\""
                      "if [[ $title =~ $pattern ]]; then"
                      "title=${patternSet.title}"
                      (
                        if builtins.pathExists (./cheatsheets + "/${patternSet.title}.md")
                        then "cheatsheet='${(
                          builtins.readFile (./cheatsheets + "/${patternSet.title}.md")
                        )}'"
                        else "cheatsheet='no file exists for ${patternSet.title}'"
                      )
                      "break"
                      "fi"
                      "done"
                    ]
                )
                infoset.patternSets
              ))
              ";;"
            ]
          )
        )
        cheatsheets
      )
    )
    "*)"
    ";;"
    "esac"
  ];

  # run before entering workspace
  script = pkgs.writeShellApplication {
    name = scriptName;

    runtimeInputs = with pkgs; [
      cowsay
      jq
      glow
    ];

    text = ''
      title=$(hyprctl -j clients | jq -r '.[] | select(.focusHistoryID==1) | .title')
      initial_title=$(hyprctl -j clients | jq -r '.[] | select(.focusHistoryID==1) | .initialTitle')
      cheatsheet="$(cowsay "no elp for $initial_title")"

      ${patternScript}

      echo "$cheatsheet" | glow -p -s dracula
    '';
  };
in {
  wayland.windowManager.hyprland = {
    settings = {
      workspace = [
        "special:${workspaceName}, gapsin:0, gapsout:0, on-created-empty: $terminal ${script}/bin/${scriptName}"
      ];
      windowrulev2 = [
        "float, onworkspace:special:${workspaceName}"
        "size 50% 90%, onworkspace:special:${workspaceName}"
        "move 45% 5%, onworkspace:special:${workspaceName}"
      ];
      bind = [
        "$mod, ${toggleKey}, togglespecialworkspace, ${workspaceName}"
        "$mod, ${toggleKey}, submap, ${workspaceName}"
      ];
    };
    extraConfig = ''
      submap = ${workspaceName}
      bindnr = , Q, submap, reset
      bind = $mod, ${toggleKey}, sendshortcut, , Q,title:${scriptName}
      bind = $mod, ${toggleKey}, submap, reset
      submap = reset
    '';
  };
}
