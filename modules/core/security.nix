{ ... }:

{
  security = {
    sudo.enable = true;
    sudo.wheelNeedsPassword = true;

    polkit.enable = true;

    rtkit.enable = true;

    protectKernelImage = true;

    lockKernelModules = false;
  };

  services.openssh = {
    enable = false;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  boot.kernelParams = [
    "audit=1"
  ];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [];
    allowedUDPPorts = [];
  };

  networking.nftables.enable = true;
}
