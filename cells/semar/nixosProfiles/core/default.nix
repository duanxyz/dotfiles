{
  inputs,
  cell,
}: let
  inherit
    (inputs.nixpkgs)
    pkgs
    ;
in {
  environment.systemPackages = with pkgs; [
    wget
    bash
    dash
    powertop
  ];
}
