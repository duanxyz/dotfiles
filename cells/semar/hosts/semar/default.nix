{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs bee;
  inherit (nixpkgs) pkgs;

  tartarus = builtins.fetchGit {
    url = "https://github.com/AllJavi/tartarus-grub";
    rev = "b116360a2a0991062a4d728cb005dfd309fbb82a";
  };
in {
  inherit bee;

  imports = [
    ./_extraHosts.nix
    cell.hardwareProfiles.semar
    cell.nixosProfiles.core
    cell.nixosProfiles.fonts
    cell.nixosProfiles.git
    cell.nixosProfiles.fish
    cell.nixosProfiles.plasma5
    cell.nixosProfiles.ssh
    cell.nixosProfiles.pipewire
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
    theme = "${tartarus}/tartarus";
  };

  networking = {
    hostName = "semar";
    networkmanager.enable = true;
  };
  programs.nm-applet.enable = true;

  time.timeZone = "Asia/Makassar";

  nix.settings.trusted-users = [
    "duan"
  ];

  environment.binsh = "${pkgs.dash}/bin/dash";

  system.stateVersion = "23.05";
}
