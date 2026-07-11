{ config, pkgs, ... }: {

  programs.git = {
    enable = true;

    config = {
      user.name = "lza09";
      user.email = "lza09@proton.me";

      init.defaultBranch = "main";
    };
  };
}
