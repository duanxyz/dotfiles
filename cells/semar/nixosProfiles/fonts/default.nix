{
  fonts = {
    enableDefaultFonts = false;
    fontDir.enable = true;

    fonts = with inputs.nixpkgs; [
      material-design-icons
      font-awesome

      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "JetBrainsMono"
          "Iosevka"
        ];
      })
    ];
  };
}
