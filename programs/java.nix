{ pkgs, ... }:

{
  systemd.tmpfiles.rules = [
    "L+ /opt/zulu-jdk-25 - - - - ${pkgs.zulu25}"
    "L+ /opt/zulu-jdk-21 - - - - ${pkgs.zulu21}"
    "L+ /opt/zulu-jdk-17 - - - - ${pkgs.zulu17}"
    "L+ /opt/zulu-jdk-8 - - - - ${pkgs.zulu8}"
  ];
}
