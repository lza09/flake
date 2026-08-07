{ pkgs, ... }:

{
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  security.pam.services = {
    sddm.kwallet.enable = false;
    login.kwallet.enable = false;
  };

  environment.systemPackages = with pkgs.kdePackages; [
  dolphin
  konsole
  spectacle
  ark
  gwenview
  plasma-pa
  bluedevil
  kscreen
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];
  };

  xdg.mime.enable = true;
  xdg.icons = {
    enable = true;
    fallbackCursorThemes = [
      "breeze_cursors"
    ];
  };
}
