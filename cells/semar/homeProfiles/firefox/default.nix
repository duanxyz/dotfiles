{
  inputs,
  cell,
}: let
  inherit (inputs.nixpkgs) pkgs;
in {
  programs.firefox = {
    enable = true;
    package = inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin;
  };
}
