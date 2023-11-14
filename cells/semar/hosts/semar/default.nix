{inputs}: let
  inherit (inputs) nixpkgs bee;
  inherit (nixpkgs) pkgs;
in {
  inherit bee;

  imports = [
    cell.hardwareProfiles.semar
    cell.nixosProfiles.core
    cell.nixosProfiles.git
    cell.nixosProfiles.fish
    cell.users.duan
    cell.users.root
  ];

  home-manager = {
    users.duan = {
      imports = [
        cell.homeProfiles.core
        cell.homeProfiles.neovim
        cell.homeProfiles.firefox
        cell.homeProfiles.vscode
        cell.homeProfiles.helix
        cell.homeProfiles.git
        cell.homeProfiles.fish
      ];
      home.stateVersion = "23.05";
    };
  };

  boot.loader.grub = {
    device = "nodev";
    enable = true;
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  networking = {
    hostName = "semar";
    networkmanager.enable = true;
  };
  programs.nm-applet.enable = true;

  time.timeZone = "Asia/Makassar";

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # programs.fish.enable = true;

  services.openssh.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  nix.settings.trusted-users = [
    "duan"
  ];

  users.defaultUserShell = pkgs.fish;

  system.stateVersion = "23.05";
}
