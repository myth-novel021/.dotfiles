{ ... }:

{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 20;
      };

      efi.canTouchEfiVariables = true;
      
      timeout = 3;
    };

    initrd.systemd.enable = true;

    supportedFilesystems = [
      "btrfs"
    ];

    kernel.sysctl = {
      "kernel.sysrq" = 0;
      "kernel.kptr_restrict" = 2;
      "kernel.dmesg_restrict" = 1;
    };
  };

  systemd.services.fstrim = {
    enable = true;
  };
}
