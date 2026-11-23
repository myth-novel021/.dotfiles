{ pkgs, ... }:

{
  services.upower.enable = true;

  services.tuned = {
    
    enable = true;

    ppdSupport = true;
    ppdSettings = {
      
      main.default = "balanced";

      profiles = {
        power-saver = "powersave";
        balanced = "balanced";
        performance = "throughput-performance";
      };

      battery = {
        power-saver = "powersave";
        balanced = "balanced-battery";
        performance = "throughput-performance";
      };
    };
  };

  services.power-profiles-daemon.enable = false;

  environment.systemPackages = with pkgs; [
    power-profiles-daemon
    upower
  ];
}
