{ config, ...}:

{
  disko.devices.disk.main = {
    type = "disk";
    
    content = {
      type = "gpt";

      partitions = {

        ESP = {
          end = "1G";
          type = "EF00";
          priority = 1;
          
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [ "umask=0077" ];
          };
        };

        root = {
          end = "-16G";
          priority = 2;

          content = {
            type = "btrfs";

            extraArgs = [ "-f" ];

            subvolumes = {

              "@" = {
                mountpoint = "/";
                mountOptions = [ "compress=zstd" "noatime" ];
              };

              "@nix" = {
                mountpoint = "/nix";
                mountOptions = [ "compress=zstd" "noatime" ];
              };

              "@log" = {
                mountpoint = "/var/log";
                mountOptions = [ "compress=zstd" "noatime" ];
              };

              "@snapshots" = {
                mountpoint = "/.snapshots";
                mountOptions = [ "compress=zstd" "noatime" ];
              };
            };
          };
        };

        swap = {
          size = "16G";
          priority = 3;

          content = {
            type = "swap";
            resumeDevice = true;
          };
        };
      };
    };
  };
}

