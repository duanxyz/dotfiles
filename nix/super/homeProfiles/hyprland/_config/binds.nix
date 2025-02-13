let
  mod = "SUPER";
in {
  binds = {
    workspace_back_and_forth = true;
  };

  bind = [
    # Run Applications
    "${mod}, B, exec, uwsm-app -- brave"
    "${mod}, RETURN, exec, uwsm-app -- kitty"
    "${mod}, C, exec, uwsm-app -- codium"

    # Window Control
    "${mod}, Q, killactive"
    "${mod}, F, fullscreen, 1"
    "${mod}, Space, togglefloating"
    "${mod}, GRAVE, togglespecialworkspace, scratchpad"
    "${mod} SHIFT, GRAVE, movetoworkspace, special:scratchpad"
    "${mod}, Space, togglefloating"
    "${mod}, S, togglesplit,"
    "${mod}, R, exec, hyprctl reload"
    ''${mod} ALT, R, exec, hyprctl --batch "animations:enabled false ; keyword decoration:blur:enabled false"''

    # Move focus with mod + arrow keys
    "${mod}, left, movefocus, l"
    "${mod}, right, movefocus, r"
    "${mod}, up, movefocus, u"
    "${mod}, down, movefocus, d"

    "${mod}, H, movefocus, l"
    "${mod}, L, movefocus, r"
    "${mod}, K, movefocus, u"
    "${mod}, J, movefocus, d"

    # Workspace Navigation
    "${mod}, 1, workspace, 1"
    "${mod}, 2, workspace, 2"
    "${mod}, 3, workspace, 3"
    "${mod}, period, workspace, +1"
    "${mod}, comma, workspace, -1"

    # Move active window to a workspace
    "${mod} SHIFT, 1, movetoworkspace, 1"
    "${mod} SHIFT, 2, movetoworkspace, 2"
    "${mod} SHIFT, 3, movetoworkspace, 3"
    "${mod} SHIFT, left, movetoworkspace, l"
    "${mod} SHIFT, right, movetoworkspace, r"

    # Precise window reisizing
    "${mod} CTRL, H, resizeactive, -50 0"
    "${mod} CTRL, L, resizeactive, 50 0"
    "${mod} CTRL, K, resizeactive, 0 -50"
    "${mod} CTRL, J, resizeactive, 0 50"

    # Smart Aspect Ratio Control
    "${mod} SHIFT, H, resizeactive, exact 640 480"
    "${mod} SHIFT, L, resizeactive, exact 854 480"
    "${mod} SHIFT, K, resizeactive, exact 960 540"

    # Pixel-perfect Movement
    "${mod} CTRL, left, movewindow, l"
    "${mod} CTRL, right, movewindow, r"
    "${mod} CTRL, up, movewindow, u"
    "${mod} CTRL, down, movewindow, d"

    # Workspace Warping
    "${mod}, Tab, workspace, previous"
  ];

  bindel = [
    # Screen brightness
    ", XF86MonBrightnessUp, exec, brightnessctl set +2%"
    ", XF86MonBrightnessDown, exec, brightnessctl set 2%-"

    # Volume and Media Control
    ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
    ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
  ];

  bindl = ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
}
