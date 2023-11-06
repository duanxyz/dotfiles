let
  inherit (inputs.unstable) pkgs;
in {
  programs.helix = {
    enable = true;
    package = pkgs.helix;
  };
}
