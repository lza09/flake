{ config, pkgs, ... }:

{
  nix = {
    package = pkgs.nixVersions.latest;
    channel.enable = false;
    nixPath = [
      "nixpkgs=${config.nixpkgs.flake.source}"
    ];

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d";
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
  ];

  users.users.nix = {
    isNormalUser = true;
    description = "nix";
    extraGroups = [
      "wheel"
    ];
  };

  system.stateVersion = "26.05";
}
