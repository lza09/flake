{ ... }:

{
  programs.git = {
    enable = true;

    config = {
      user.name = "lza09";
      user.email = "lza09@proton.me";

      init.defaultBranch = "main";

      user.signingkey = "9036A64B784AA588";
      commit.gpgsign = true;
    };
  };
}
