{
  inputs,
  cell,
}: let
  inherit (inputs.nixpkgs) pkgs;
in {
  fonts = {
    enableDefaultPackages = false;
    fontDir.enable = true;

    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [];
        sansSerif = [];
        serif = [];
      };
      useEmbeddedBitmaps = true;
    };
  };
}
