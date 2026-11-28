{
  caerula = rec {
    name = "caerula";
    type = "os";
    user = [
      "rei"
    ];
    system = "x86_64-linux";
    stateVersion = "26.05";
  };

  oblivio = rec {
    name = "oblivio";
    type = "os";
    user = [
      "rei"
    ];
    system = "x86_64-linux";
    stateVersion = "26.05";
    device = "vm";
    deviceID = "dev/disk/by-path/virtio-pci-0000:05:00.0";
  };

  rei = rec {
    name = "rei";
    type = "home";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "render"
      "libvirtd"
      "kvm"
      "dialout"
      "lp"
      "scanner"
    ];
    stateVersion = "26.05";
    package = [
      "default"
    ];
  };
}
