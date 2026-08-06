{ config, pkgs, ... }:

{
  nix = {
    package = pkgs.nix;
    channel.enable = false;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    nixPath = [
      "nixpkgs=${config.nixpkgs.flake.source}"
    ];

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  networking.hostName = "os";
  time.timeZone = "Asia/Seoul";
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    btop
    curl
    fd
    git
    htop
    jq
    ncdu
    ripgrep
    wget
    tree
    fastfetch
  ];

  users.users.nix = {
    isNormalUser = true;
    description = "nix";

    extraGroups = [
      "wheel"
    ];
  };

  security.sudo.wheelNeedsPassword = true;

  system.stateVersion = "26.05";
}
