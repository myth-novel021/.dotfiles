{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ../vm.nix
      ./hardware-configuration.nix
      ../../modules/core
      ../../modules/desktop
    ];

  system.stateVersion = "26.05";
}
