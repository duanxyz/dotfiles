{
  inputs,
  cell,
  pkgs,
  config,
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      kamadorueda.alejandra
      jnoortheen.nix-ide
    ];
  };
}
