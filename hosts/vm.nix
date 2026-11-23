{ ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  services.qemuGuest.enable = true;

  services.spice-vdagentd.enable = true;

  hardware.graphics.enable = true;

  boot.initrd.availableKernelModules = [
    "virtio_pci"
    "virtio_blk"
    "virtio_scsi"
    "virtio_net"
  ];

  system.stateVersion = "26.05";
}
