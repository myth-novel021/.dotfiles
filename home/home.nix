{ inputs, pkgs, user, host ? user, ... }:

{
  imports = map( package: ./components/${package}.nix;) user.package;

  home.username = user.name;
  home.homeDirectory = "/home/${user.name}";

  home.stateVersion = host.stateVersion;

  programs.home-manager.enable = true;

  xdg.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "brave";
    TERMINAL = "ghostty";
  };
}
