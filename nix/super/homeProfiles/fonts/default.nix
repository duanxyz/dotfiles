{
  inputs,
  cell,
}: {
  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = ["JetBrainsMono Nerd Font"];
  };
}
