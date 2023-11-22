{
  inputs,
  cell,
}: let
  inherit (inputs.nixpkgs) pkgs;
in {
  home.packages = with pkgs; [
    rnix-lsp
    alejandra
    nvfetcher
  ];
}
