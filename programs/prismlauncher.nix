{ pkgs, ... }:

{
  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      stdenv.cc.cc.lib
    ];
  };

  environment.systemPackages = with pkgs; [
    (prismlauncher.override {
      jdks = [
        "/opt/zulu-jdk-25"
        "/opt/zulu-jdk-21"
        "/opt/zulu-jdk-17"
        "/opt/zulu-jdk-8"
      ];
    })
  ];
}