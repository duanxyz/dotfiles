{
  semar = {
    disko.devices = {
      disk = {
        vdb = {
          type = "disk";
          device = "/dev/nvme0n1";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                size = "257M";
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
              luks = {
                size = "100%";
                content = {
                  type = "luks";
                  name = "crypted";
                  extraOpenArgs = ["--allow-discards"];
                  # if you want to use the key for interactive login be sure there is no trailing newline
                  # for example use `echo -n "password" > /tmp/secret.key`
                  # settings.keyFile = "/tmp/secret.key";
                  # additionalKeyFiles = [ "/tmp/additionalSecret.key" ];
                  content = {
                    type = "lvm_pv";
                    vg = "pool";
                  };
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
              size = "100G";
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
              size = "50G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/home";
              };
            };
            raw = {
              size = "100M";
            };
          };
        };
      };
    };
  };
}
