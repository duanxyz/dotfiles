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
                  mountOptions = [
                    "defaults"
                  ];
                };
              };
              windows_re = {
                size = "16M";
              };
              windows = {
                size = "65G";
              };
              luks = {
                size = "100%";
                content = {
                  type = "luks";
                  name = "crypted";
                  extraOpenArgs = [];
                  settings = {
                    # if you want to use the key for interactive login be sure there is no trailing newline
                    # for example use `echo -n "password" > /tmp/secret.key`
                    # keyFile = "/var/secret.key";
                    allowDiscards = true;
                  };
                  # additionalKeyFiles = ["/var/additionalSecret.key"];
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
          device = "/dev/mmcblk2";
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
                mountOptions = [
                  "defaults"
                ];
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
            raw = {
              size = "10M";
            };
          };
        };
        extra = {
          type = "lvm_vg";
          lvs = {
            tmp = {
              size = "1.5G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/tmp";
              };
            };
            var = {
              size = "1G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/var";
              };
            };
            swap = {
              size = "100%FREE";
              content = {
                type = "swap";
              };
            };
          };
        };
      };
    };
  };
}
