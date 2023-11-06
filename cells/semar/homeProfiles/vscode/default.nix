let
  inherit (inputs.unstable) pkgs;
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
  };
}
