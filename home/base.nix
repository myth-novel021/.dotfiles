{ pkgs, hostname, ... }:

{
  imports = [
    ./${hostname}.nix
  ];

  home = {
    hostname = ${hostname};
    homeDirectory = "/home/${hostname}";

    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;

  xdg.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "brave";
    TERMINAL = "ghostty";
  };
}
