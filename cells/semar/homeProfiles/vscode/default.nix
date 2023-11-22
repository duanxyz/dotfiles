{
  inputs,
  cell,
}: let
  inherit (inputs.nixpkgs) pkgs;
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
  };
}
