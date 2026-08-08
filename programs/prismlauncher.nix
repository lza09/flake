{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (prismlauncher.override {
      additionalLibs = [
        libgbm
        glib
        nss
        nspr
        atk
        at-spi2-atk
        libdrm
        expat
        libxcb
        libxkbcommon
        libX11
        libXcomposite
        libXdamage
        libXext
        libXfixes
        libXrandr
        gtk3
        pango
        cairo
        alsa-lib
        dbus
        at-spi2-core
        cups
        libxshmfence
        wayland
      ];
      jdks = [
        "/opt/zulu-jdk-25"
        "/opt/zulu-jdk-21"
        "/opt/zulu-jdk-17"
        "/opt/zulu-jdk-8"
      ];
    })
  ];
}
