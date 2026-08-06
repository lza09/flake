{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscode
  ];

  xdg.mime.defaultApplications = {
    "text/plain" = "code.desktop";
    "text/markdown" = "code.desktop";
    "application/json" = "code.desktop";
    "text/x-csrc" = "code.desktop";
    "text/x-c++src" = "code.desktop";
    "text/x-python" = "code.desktop";
  };
}
