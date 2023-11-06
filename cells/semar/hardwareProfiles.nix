let
  inherit (inputs) nixos-hardware nixpkgs;
  inherit (nixpkgs) lib;
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
  };
}
