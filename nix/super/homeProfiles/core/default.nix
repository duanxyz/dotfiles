{
  inputs,
  cell,
  pkgs,
}: {
  home.packages = with pkgs; [
    nil
    alejandra
    xdg-utils
  ];
}
