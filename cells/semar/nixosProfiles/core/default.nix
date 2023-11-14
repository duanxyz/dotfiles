let
  inherit
    (inputs.nixpkgs)
    pkgs
    ;
in {
  environment.systemPackages = with pkgs; [
    wget
  ];
}
