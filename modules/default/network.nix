{ ... }:

{
  networking = {
    networkimanager.enable = true;

    useDHCP = false;

    nftables.enable = true;
  };

  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        DNSSEC = "allow-downgrade";
        DNSOverTLS = "opportunistic";
      };
    };
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;
}
