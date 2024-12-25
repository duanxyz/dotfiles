{
  inputs,
  cell,
  pkgs,
}: let
  inherit (inputs) bee;
in {
  inherit bee;

  imports = [
    cell.hardwareProfiles.semar
    cell.nixosProfiles.core
    cell.nixosProfiles.pipewire
    cell.nixosProfiles.auto-cpufreq
    cell.nixosProfiles.ssh
    cell.nixosProfiles.plasma
    cell.users.duan
    cell.users.root
  ];

  home-manager = {
    # backupFileExtension = "rebuild";
    users.duan = {
      imports = [
        cell.homeProfiles.core
        cell.homeProfiles.git
        cell.homeProfiles.chromium
        cell.homeProfiles.vscode
      ];
      home.stateVersion = "24.11";
    };
  };

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      device = "nodev";
      enable = true;
      efiSupport = true;
      splashImage = null;
      useOSProber = true;
    };
  };

  boot.supportedFilesystems = ["ntfs"];

  networking = {
    hostName = "semar";
    networkmanager.enable = true;
  };
  programs.nm-applet.enable = true;

  powerManagement.powertop.enable = true;
  services.power-profiles-daemon.enable = false;
  services.upower.enable = true;

  # nix-store Optimize
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
    settings = {
      trusted-users = [
        "root"
        "@wheel"
      ];
      allowed-users = [
        "@wheel"
      ];
      auto-optimise-store = true;
    };
  };

  security = {
    polkit.enable = true;
    audit.enable = true;
  };

  nix.settings.experimental-features = ["nix-command flakes"];

  environment.binsh = "${pkgs.dash}/bin/dash";

  time.timeZone = "Asia/Makassar";

  system.stateVersion = "24.11";
}
