{
  inputs,
  cell,
}: {
  programs.swaylock = {
    enable = true;
    package = inputs.nixpkgs.swaylock-effects;
    settings = {
      screenshots = true;
      clock = true;
      indicator = true;
      indicator-radius = 120;
      indicator-thickness = 16;
      effect-blur = "9x9";
      fade-in = 0.15;
      separator-color = "000000";
      inside-wrong-color = "bf616a";
      line-wrong-color = "bf616a";
      ring-wrong-color = "bf616a";
      inside-clear-color = "a3be8c";
      ring-clear-color = "a3be8c";
      line-clear-color = "a3be8c";
      inside-ver-color = "8fbcbb";
      ring-ver-color = "8fbcbb";
      line-ver-color = "8fbcbb";
      text-color = "eceff4";
      ring-color = "3b4252";
      key-hl-color = "81a1c1";
      line-color = "3b4252";
      inside-color = "3b4252";
    };
  };
}
