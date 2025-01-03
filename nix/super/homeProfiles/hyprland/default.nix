{
  inputs,
  cell,
  pkgs,
}: let
  layouts = import ./_config/layouts.nix;
  binds = import ./_config/binds.nix;
  animations = import ./_config/animations.nix;
  decoration = import ./_config/decoration.nix;
  general = import ./_config/general.nix;
  gestures = import ./_config/gestures.nix;
  input = import ./_config/input.nix;
  misc = import ./_config/misc.nix;
  autostart = import ./_config/autostart.nix;
  env = import ./_config/env;
in {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemd.enable = false;

    settings = lib.mkMerge [
      layouts
      binds
      animations
      decoration
      general
      gestures
      input
      misc
      autostart
    ];
    extraConfig = ''
      # experiment
      source = ~/.config/hypr/extra.conf
    '';
  };

  xdg.configFile."uwsm/env".source = ./_config/env;
  xdg.configFile."uwsm/env-hyprland".source = ./_config/env-hyprland;
}
