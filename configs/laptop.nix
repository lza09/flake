{ config, pkgs, lib, ... }: {

  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.initrd.availableKernelModules = [ "xe" ];

  boot.kernelParams = [
    "mitigations=off"
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

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
