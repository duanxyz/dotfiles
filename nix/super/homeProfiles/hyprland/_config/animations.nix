{
  animations = {
    enabled = true;
    first_launch_animation = true;

    bezier = [
      "overshot, 0.32, 0.72, 0.38, 1.1"
      "linear, 0, 0, 1, 1"
      "wind, 0.05, 0.9, 0.1, 1.05"
      "winIn, 0.1, 1.1, 0.1, 1.1"
      "winOut, 0.3, -0.3, 0, 1"
    ];

    animation = [
      "windows, 1, 4, wind, slide"
      "windowsIn, 1, 4, winIn, slide"
      "windowsOut, 1, 4, winOut, slide"
      "fade, 1, 4, overshot"
      "workspaces, 1, 4, wind, slidevert"
      "border, 1, 10, linear"
    ];
  };
}
