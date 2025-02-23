{
  inputs,
  cell,
  pkgs,
}:
{
  home.packages = with pkgs; [
    nil
    nixd
    nixfmt-rfc-style
    alejandra
    nodePackages.prettier
    xdg-utils
    warp-terminal
  ];
}
