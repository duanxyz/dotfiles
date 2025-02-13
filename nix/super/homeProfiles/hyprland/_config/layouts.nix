{
  monitor = "eDP-1,1920x1080@60,0x0,1";

  dwindle = {
    pseudotile = true;
    preserve_split = true;
    force_split = 2;
    permanent_direction_override = true;
    special_scale_factor = 0.95;
  };

  master = {
    orientation = "right";
    mfact = 0.6;
    inherit_fullscreen = true;
    always_center_master = true;
  };
}
