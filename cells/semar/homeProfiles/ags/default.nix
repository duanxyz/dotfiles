{
  inputs,
  cell,
}: {
  imports = [inputs.ags.homeManagerModules.default];

  programs.ags = {
    enable = true;
    # configDir = ./_config;
    extraPackages = [inputs.nixpkgs.libsoup_3];
  };

  home.packages = with inputs.nixpkgs; [
    sassc
    inotify-tools
  ];
}
