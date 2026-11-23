{ ... }:

{
  imports = [
    ./modules/nix.nix
    ./modules/boot.nix
    ./modules/security.nix
    ./modules/networking.nix
    ./disko/default.nix
  ];
}
