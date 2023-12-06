{
  inputs,
  cell,
}: let
  inherit (inputs.nixpkgs) pkgs;
in {
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    extraConfig = ''
      exec-once = wbg ${./_config/background.png} &

      ${builtins.readFile ./_config/basic.conf}
      ${builtins.readFile ./_config/keybinds.conf}
      
      source = ~/.config/hypr/extra.conf
    '';
  };

  services.cliphist = {
    enable = true;
    systemdTarget = "hyprland-session.target";
  };

  home.packages = with pkgs; [
    wbg
    brightnessctl
    wl-clipboard
  ];
}
