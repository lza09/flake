{ pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.initrd.availableKernelModules = [
    "xe"
  ];

  boot.kernelParams = [
    "mitigations=off"
    "zswap.enabled=1"
    "zswap.shrinker_enabled=1"
    "zswap.compressor=zstd"
    "zswap.max_pool_percent=30"
    "nowatchdog"
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16384;
    }
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-compute-runtime
      vpl-gpu-rt
    ];
  };

  services = {
    libinput.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
}
