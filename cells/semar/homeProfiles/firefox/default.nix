let
  inherit (inputs.unstable) pkgs;
in {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;
  };
}
