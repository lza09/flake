{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustup
    rust-analyzer
    gcc
    pkg-config
    cmake
    gnumake
    zlib
  ];
}
