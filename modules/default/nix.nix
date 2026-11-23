{ pkgs, ... }:

{
  nix = {
    settings = {
      
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      
      auto-optimise-store = true;

      builders-use-substitutes = true;

      trusted-users = [ "root" ];

      substituters = [
        "https://cache.nixos.org"
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    optimise.automatic = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    neovim
    curl
    xh
    bottom
    duf
    dust
    tlrc
    yazi
    pciutils
    usbutils
  ];
}
