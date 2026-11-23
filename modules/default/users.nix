{ pkgs, hostname, ... }:

{
  users.mutableUsers = true;

  users.users.${hostname} = {

    isNormalUser = true;

    extraGroups = [
      "wheel"
      "networkmanager"
    ];

    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  security.sudo = {
    enable = true;
    wheelNeedsPassword = true;
  };
}
