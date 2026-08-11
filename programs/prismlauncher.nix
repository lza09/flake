{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (prismlauncher.override {
      additionalLibs = [
        alsa-lib
        at-spi2-atk
        at-spi2-core
        atk
        cairo
        cups
        dbus
        expat
        flite
        glib
        glfw
        gtk3
        libGL
        libX11
        libXcomposite
        libXcursor
        libXdamage
        libXext
        libXfixes
        libXrandr
        libdrm
        libgbm
        libpulseaudio
        libxcb
        libxkbcommon
        libxshmfence
        nodejs_24
        nspr
        nss
        openal
        pango
        stdenv.cc.cc.lib
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
