{
  inputs,
  cell,
}: let
  inherit (inputs) nixos-hardware nixpkgs;
  inherit (nixpkgs) lib;
in {
  semar = {
    imports = [
      nixos-hardware.nixosModules.dell-xps-15-9510
      inputs.disko.nixosModules.disko
      cell.diskoConfigurations.semar
    ];
    boot = {
      initrd = {
        availableKernelModules = [
          "xhci_pci"
          "nvme"
          "usb_storage"
          "sd_mod"
          "sdhci_pci"
          "rtsx_usb_sdmmc"
        ];
        kernelModules = [
          "dm-snapshot"
          "i915"
        ];
      };
      kernelModules = [
        "kvm-intel"
        "i915"
      ];
      extraModulePackages = [];
    };

    zramSwap = {
      enable = true;
      swapDevices = 1;
      memoryPercent = 25;
      priority = 100;
      algorithm = "lz4";
      memoryMax = null;
    };

    swapDevices = [
      {
        device = "/dev/mapper/extra-swap";
        priority = -2;
      }
    ];

    systemd.tmpfiles.rules = [
      "w /sys/module/zswap/parameters/max_pool_percent - - - - 20"
      "w /sys/module/zswap/parameters/compressor - - - - lz4"
    ];

    boot.kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.dirty_ratio" = 10;
      "vm.dirty_background_ratio" = 5;
    };

    networking.useDHCP = lib.mkDefault true;
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.enableRedistributableFirmware = lib.mkDefault true;

    hardware.graphics = {
      enable = true;
      enable32Bit = false;
      extraPackages = with nixpkgs; [
        intel-media-driver
        intel-compute-runtime
        intel-vaapi-driver
      ];
      extraPackages32 = [];
    };
  };
}
