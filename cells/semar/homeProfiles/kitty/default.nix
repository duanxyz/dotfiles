{
  inputs,
  cell,
  ...
}: let
  inherit (inputs.unstable) pkgs;
in {
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    theme = "Gruvbox Material Dark Soft";
    font = {
      name = "JetBrains Mono Nerd Font";
      size = 16.0;
    };
    settings = {
      remember_window_size = "no";
      initial_window_width = 1080;
      initial_window_height = 600;
      window_margin_width = 15;
      confirm_os_window_close = 0;
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "angled";
      #Cursor config
      cursor_shape = "beam";
      cursor_blink_interval = 0;
      disable_ligatures = "never";

      #url customization
      url_style = "curly";
    };
    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "cmd+c" = "copy_and_clear_or_interrupt";
      "ctrl+n" = "new_tab";
      "ctrl+shift+1" = "goto_tab 1";
      "ctrl+shift+2" = "goto_tab 2";
      "ctrl+shift+3" = "goto_tab 3";
      "ctrl+shift+4" = "goto_tab 4";
      "ctrl+shift+5" = "goto_tab 5";
      "ctrl+shift+6" = "goto_tab 6";
      "ctrl+shift+7" = "goto_tab 7";
      "ctrl+shift+8" = "goto_tab 8";
      "ctrl+shift+9" = "goto_tab 9";
      "ctrl+shift+0" = "goto_tab 0";
    };
  };
}
