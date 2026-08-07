{ pkgs, ... }:

{
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  security.pam.services = {
    sddm.kwallet.enable = false;
    login.kwallet.enable = false;
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    discover
    elisa
    kate
    khelpcenter
    kwallet
    kwallet-pam
    kwalletmanager
    kwrite
    okular
    plasma-systemmonitor
    print-manager
    qrca
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
