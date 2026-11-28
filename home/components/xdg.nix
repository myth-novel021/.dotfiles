{ ... }:

{
  xdg = {
    enable = true;

    localBinInPath = true;

    userDirs = {
      enable = true;
      createDirectories = true;
    };

    mime.enable = true;

    autostart.enable = true;
  };

  home.preferXdgDirectories = true;
}
