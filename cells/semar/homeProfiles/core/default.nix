let
  inherit (inputs) unstable;
in {
  home.packages = with unstable; [
    rnix-lsp
    alejandra
    nvfetcher
  ];
}
