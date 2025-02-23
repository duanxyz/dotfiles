{
  inputs,
  cell,
}:
let
  inherit (inputs.nixpkgs) pkgs lib;
in
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      vscode-langservers-extracted
      yaml-language-server
      bash-language-server
      fish-lsp
      marksman
      taplo
    ];

    languages = lib.mkMerge (
      builtins.attrValues (
        inputs.haumea.lib.load {
          src = ./_config;
          loader = inputs.haumea.lib.loaders.scoped;
          inputs = { inherit pkgs lib; };
        }
      )
    );
  };
}
