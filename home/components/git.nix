{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    package = pkgs.git.override { withLibsecret = true; };

    settings = {
      user = {
        name = "myth-novel021";
        email = "myth.novel021@gmail.com";
      };

      push.autoSetupRemote = true;

      credential.helper = "libsecret";
    };
  };
}
