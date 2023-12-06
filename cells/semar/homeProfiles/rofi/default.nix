{
  inputs,
  cell,
}: let
  inherit (inputs.nixpkgs) pkgs;
in {
  home.packages = with pkgs; [
    rofi-wayland
  ];

  xdg.configFile."rofi".source = ./_config;
}
