{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustup
    rust-analyzer
    gcc
    pkg-config
    cmake
    gnumake
  ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      zlib
      libgcc
    ];
  };
}
