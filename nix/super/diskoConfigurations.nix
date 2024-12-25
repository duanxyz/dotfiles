{
  semar = {
    # laptop
    disko.devices = {
      disk = {
        semar = {
          type = "disk";
          device = "/dev/nvme0n1";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                size = "260M";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = ["defaults"];
                };
              };
              windows_re = {size = "16M";};
              windows = {size = "65G";};
              luks = {
                size = "100%";
                content = {
                  type = "luks";
                  name = "crypted";
                  settings = {
                    allowDiscards = true;
                  };
                  content = {
                    type = "lvm_pv";
                    vg = "pool";
                  };
                };
              };
            };
          };
        };
        mmc = {
          type = "disk";
          device = "/dev/mmcblk0";
          content = {
            type = "gpt";
            partitions = {
              primary = {
                size = "100%";
                content = {
                  type = "lvm_pv";
                  vg = "extra";
                };
              };
            };
          };
        };
      };
      lvm_vg = {
        pool = {
          type = "lvm_vg";
          lvs = {
            root = {
              size = "50G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
                mountOptions = ["defaults"];
              };
            };
            home = {
              size = "100G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/home";
              };
            };
          };
        };
        extra = {
          type = "lvm_vg";
          lvs = {
            var_log = {
              size = "1G";
              content = {
                type = "filesystem";
                format = "f2fs";
                mountpoint = "/var/log";
                mountOptions = ["defaults" "noatime" "nodev"];
              };
            };
            var_cache = {
              size = "3G";
              content = {
                type = "filesystem";
                format = "f2fs";
                mountpoint = "/var/cache";
                mountOptions = ["defaults" "noatime" "nodev"];
              };
            };
            swap = {
              size = "100%FREE";
              content = {
                type = "swap";
                priority = -1;
              };
            };
          };
        };
      };
      nodev = {
        "/tmp" = {
          fsType = "tmpfs";
          mountOptions = [
            "size=2G"
            "defaults"
            "mode=1777"
            "noexec"
            "nodev"
            "nosuid"
          ];
        };
      };
    };
  };
}
