{ pkgs, ...}:

{
  programs.niri.enable = true;

  services.greetd = {
    enable = true;

    settings = {

      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd --niri-session";

        user = "greeter";
      };
    };
  };

  services.dbus.enable = true;

  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      xwayland-satellite
    ];
  };

  security.polkit.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];
}
