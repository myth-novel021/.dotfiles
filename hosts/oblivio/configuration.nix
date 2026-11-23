{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ../vm.nix
      ./hardware-configuration.nix
      ../../modules/default
      ../../modules/desktop
    ];

  system.stateVersion = "26.05";
}
