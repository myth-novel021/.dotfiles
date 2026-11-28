{ pkgs, ... }:

{
  zramSwap = {
    enable = true;

    memoryPercent = 75;
    algorithm = "zstd";
    priority = 100;
  };

  systemd.oomd.enable = true;

  systemd.sleep.extraConfig = ''
    AllowHibernation=yes
  '';
}
