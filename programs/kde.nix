{ pkgs, lib, ... }:

{
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  security.pam.services = {
    sddm.kwallet.enable = lib.mkForce false;
    login.kwallet.enable = lib.mkForce false;
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    discover
    elisa
    kate
    khelpcenter
    kwallet
    kwallet-pam
    kwalletmanager
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
