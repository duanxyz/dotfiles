{
  inputs,
  cell,
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = ["~/Downloads/pexels-veeterzy-39811.jpg"];

      wallpaper = [
        ",~/Downloads/pexels-veeterzy-39811.jpg"
      ];
    };
  };
}
