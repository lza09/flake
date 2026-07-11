{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

  boot.kernelParams = [
    "zswap.enabled=1"
    "zswap.shrinker_enabled=1"
    "zswap.compressor=zstd"
    "zswap.max_pool_percent=30"
    "nowatchdog"
  ];

  networking = {
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];

    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
  };
  services.resolved.enable = true;

  users.users.nix.extraGroups = [
    "networkmanager"
  ];

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.displayManager.sddm.enable = true;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ko_KR.UTF-8";
    LC_IDENTIFICATION = "ko_KR.UTF-8";
    LC_MEASUREMENT = "ko_KR.UTF-8";
    LC_MONETARY = "ko_KR.UTF-8";
    LC_NAME = "ko_KR.UTF-8";
    LC_NUMERIC = "ko_KR.UTF-8";
    LC_PAPER = "ko_KR.UTF-8";
    LC_TELEPHONE = "ko_KR.UTF-8";
    LC_TIME = "ko_KR.UTF-8";
  };

  fonts.packages = with pkgs; [
    inter
    jetbrains-mono
    noto-fonts-cjk-sans
    twitter-color-emoji
  ];

  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;

      addons = with pkgs; [
        fcitx5-hangul
        fcitx5-gtk
      ];
    };
  };

  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    sbctl
    vesktop
    vscode
    jetbrains.idea
    thunderbird-esr
    fastfetch
    obsidian
    (prismlauncher.override {
      additionalLibs = [
        jemalloc
        libxtst
        libxkbcommon
        libxt
        libxinerama
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
