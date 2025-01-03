{
  inputs,
  cell,
}: let
  inherit (inputs.nixpkgs) pkgs;
  pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.system};
in {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
    withUWSM = true; # Menggunakan Universal Wayland Session Manager
  };

  # Sistem terkait Wayland
  hardware.graphics = {
    extraPackages = with pkgs; [
      pkgs-unstable.mesa.drivers
    ];
    # if you also want 32-bit support (e.g for Steam)
    # driSupport32Bit = true;
    # extraPackage32 = [pkgs-unstable.pkgsi686Linux.mesa.drivers];
  };

  # Deklarasi layanan user systemd
  systemd.user.services.hyprpolkitagent = {
    enable = true;
    description = "Hyprland Polkit Authentication Agent";
    wantedBy = ["graphical-session.target"];
    after = ["graphical-session.target"];
    serviceConfig = {
      ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
      Restart = "always";
      RestartSec = "5s";
    };
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    hyprpolkitagent
  ];
}
