{inputs}: let
  inherit (inputs) nixpkgs bee;
  inherit (nixpkgs) pkgs;
in {
  inherit bee;

  imports = [
    cell.hardwareProfiles.semar
    cell.nixosProfiles.core
    cell.nixosProfiles.fonts
    cell.nixosProfiles.git
    cell.nixosProfiles.fish
    cell.nixosProfiles.plasma5
    cell.nixosProfiles.ssh
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
        cell.homeProfiles.alacritty
        cell.homeProfiles.kitty
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

  nix.settings.trusted-users = [
    "duan"
  ];

  users.defaultUserShell = pkgs.fish;

  system.stateVersion = "23.05";
}
