let
  inherit
    (inputs.nixpkgs)
    pkgs
    ;
in {
  environment.systemPackages = with pkgs; [
    wget
    git
  ];

  programs.fish.enable = true;
}
