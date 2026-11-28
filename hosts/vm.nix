{ ... }:

{
  imports = [
    ../modules/core
    ../modules/desktop
    ../modules/laptop
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
}
