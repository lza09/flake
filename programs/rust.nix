{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustup
    rust-analyzer
    gcc
    clang
    llvm
    pkg-config
    openssl
    cmake
    gnumake
  ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      zlib
      openssl
      libgcc
    ];
  };
}
