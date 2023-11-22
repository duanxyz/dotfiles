{
  inputs,
  cell,
}: let
  inherit (inputs.nixpkgs) pkgs;
in {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;
  };
}
