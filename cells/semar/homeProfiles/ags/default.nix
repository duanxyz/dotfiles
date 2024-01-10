{
  inputs,
  cell,
}: let
  inherit (inputs.nixpkgs) pkgs;
in {
  imports = [inputs.ags.homeManagerModules.default];

  programs.ags = {
    enable = true;
    configDir = ./_config;
    extraPackages = with pkgs; [
      libsoup_3
      libgtop
    ];
  };

  home.packages = with pkgs; [
    sassc
    inotify-tools
  ];
}
