{
  inputs,
  cell,
}: let
  inherit (inputs.nixpkgs) pkgs;
  hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
in {
  home.packages = with pkgs; [
    sway-audio-idle-inhibit
  ];

  services.swayidle = {
    enable = true;
    systemdTarget = "hyprland-session.target";
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock-effects}/bin/swaylock -f";
      }
      {
        timeout = 600;
        command = "${hyprland}/bin/hyprctl dispatch dpms off";
        resumeCommand = "${hyprland}/bin/hyprctl dispatch dpms on";
      }
      {
        timeout = 900;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = "swaylock -f &";
      }
    ];
  };
}
