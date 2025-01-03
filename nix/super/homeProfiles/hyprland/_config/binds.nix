{
  "$mod" = "SUPER";

  bind = [
    "$mod, B, exec, brave"
    "$mod, RETURN, exec, warp-terminal"
    "$mod, Q, killactive,"
    "$mod, F, fullscreen, 1"
    "$mod, P, pseudo," # dwindle
    "$mod, J, togglesplit," # dwindle
    "$mod, R, exec, hyprctl reload"

    # Move focus with mod + arrow keys
    "$mod, left, movefocus, l"
    "$mod, right, movefocus, r"
    "$mod, up, movefocus, u"
    "$mod, down, movefocus, d"

    "$mod, H, movefocus, l"
    "$mod, L, movefocus, r"
    "$mod, K, movefocus, u"
    "$mod, J, movefocus, d"

    # Switch workspaces with mod + [0-9]
    "$mod, 1, workspace, 1"
    "$mod, 2, workspace, 2"
    "$mod, 3, workspace, 3"
    "$mod, 4, workspace, 4"
    "$mod, 5, workspace, 5"
    "$mod, 6, workspace, 6"
    "$mod, 7, workspace, 7"
    "$mod, 8, workspace, 8"
    "$mod, 9, workspace, 9"
    "$mod, 0, workspace, 10"

    # Move active window to a workspace with mod + SHIFT + [0-9]
    "$mod SHIFT, 1, movetoworkspace, 1"
    "$mod SHIFT, 2, movetoworkspace, 2"
    "$mod SHIFT, 3, movetoworkspace, 3"
    "$mod SHIFT, 4, movetoworkspace, 4"
    "$mod SHIFT, 5, movetoworkspace, 5"
    "$mod SHIFT, 6, movetoworkspace, 6"
    "$mod SHIFT, 7, movetoworkspace, 7"
    "$mod SHIFT, 8, movetoworkspace, 8"
    "$mod SHIFT, 9, movetoworkspace, 9"
    "$mod SHIFT, 0, movetoworkspace, 10"
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
