{ config, lib, pkgs, host, ... }:

{
  imports =
    [ 
      ../${host.device}.nix
      ./hardware-configuration.nix
    ];

  disko.devices.disk.main.device = host.deviceID;
}
