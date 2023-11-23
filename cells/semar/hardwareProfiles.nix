{
  inputs,
  cell,
}: let
  inherit (inputs) nixos-hardware nixpkgs;
  inherit (nixpkgs) pkgs lib;
in {
  semar = {
    imports = [
      nixos-hardware.nixosModules.intel-nuc-8i7beh
      nixos-hardware.nixosModules.common-pc-ssd
      nixos-hardware.nixosModules.common-gpu-intel
      nixos-hardware.nixosModules.common-pc-laptop
      inputs.disko.nixosModules.disko
      cell.diskoConfigurations.semar
    ];
    boot.initrd.availableKernelModules = ["xhci_pci" "nvme" "usb_storage" "sd_mod" "sdhci_pci" "rtsx_usb_sdmmc"];
    boot.initrd.kernelModules = ["dm-snapshot"];
    boot.kernelModules = ["kvm-intel"];
    boot.extraModulePackages = [];
    networking.useDHCP = lib.mkDefault true;
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
    hardware.enableRedistributableFirmware = true;
    hardware.cpu.intel.updateMicrocode = lib.mkDefault true;

    # boot.extraModprobeConfig = ''
      # options iwlwifi 11n_disable=1
    # '';

    environment.systemPackages = with pkgs; [
      libva-utils
      vdpauinfo
    ];

    hardware.opengl = {
      enable = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        intel-compute-runtime
        vaapiVdpau
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-media-driver
        intel-vaapi-driver
        vaapiIntel
      ];
    };
  };
}
