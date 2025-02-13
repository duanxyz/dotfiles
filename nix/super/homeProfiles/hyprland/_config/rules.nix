{
  windowrulev2 = [
    # ---------------------------
    # Workspace Assignment Rules
    # ---------------------------
    # Workspace 1: Browser
    "workspace 1, class:^(Brave-.*)$"

    # Workspace 2: IDE/Code Editor`
    "workspace 2, class:^(codium)$"
    "stayfocused, class:^(codium)$"

    # Workspace 3: Terminal
    "workspace 3, class:^(kitty|dev.warp.Warp|waveterm)$"
    "opacity 0.85 override, class:^(kitty|dev.warp.Warp|waveterm)$"

    # ---------------------------
    # Window Behavior Rules
    # ---------------------------
    # Terminal Popups
    "float, class:^(kitty)$, title:^(btop|nmtui|htop|neofetch)$"
    "size 60% 50%, class:^(kitty)$, title:^(btop|nmtui|htop|neofetch)$"
    "move cursor -50% -40%, class:^(kitty)$, title:^(btop|nmtui|htop|neofetch)$"
    "animation popin 90%, class:^(kitty)$, title:^(btop|nmtui|htop|neofetch)$"
    "nofocus, class:^(kitty)$, title:^(btop|nmtui|htop|neofetch)$"

    # ---------------------------
    # Productivity Enhancements
    # ---------------------------
    # Video Popouts
    "float, title:^(Picture in picture)$"
    "pin, title:^(Picture in picture)$"
    "size 25% 25%, title:^(Picture in picture)$"
    "move 72% 7%, title:^(Picture in picture)$"

    # Temporary Windows
    "float, class:^(.*)$, title:^(.*)(open)(.*)$"
    "float, class:^(.*)$, title:^(.*)(File)(.*)$"

    # ---------------------------
    # Workspace Management Rules
    # ---------------------------
    # Auto-back to Workspace 1 when browser closed
    "workspace 1 silent, class:^(Brave-.*)$, onworkspaceclose:1"
  ];

  # Special Workspaces
  workspace = [
    "special:scratchpad, gapsin:0, gapsout:0, border:false, on-created-empty:kill"
    "special:scratchpad, on-created-empty:kitty "
  ];
}
