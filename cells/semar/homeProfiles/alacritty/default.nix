{
  inputs,
  cell,
  ...
}: let
  inherit (inputs.unstable) pkgs;
  schemes = import ./_config/schemes.nix;
  SHELL = /run/current-system/sw/bin/fish;
in {
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    settings = {
      imports = [
        ./_config/fonts.nix
        (builtins.fromTOML (builtins.readFile ./_config/key_bindings.toml)).key_bindings
      ];

      env.TERM = "alacritty";
      window = {
        padding = {
          x = 20;
          y = 20;
        };
        dynamic_padding = false;
        opacity = 1;
        decorations = "none";
        title = "Alacritty";
        class = {
          instance = "Alacritty";
          general = "Alacritty";
        };
      };

      scrolling = {
        history = 5000;
      };

      draw_bold_text_with_bright_colors = true;

      colors = schemes.gruvbox_material_soft_dark;

      cursor = {
        style = "Beam";
        unfocused_hollow = false;
      };

      shell = {
        program = "${pkgs.fish}/bin/fish";
      };
    };
  };
}
