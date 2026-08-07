{ ... }:

{
  programs.git = {
    enable = true;

    config = {
      user.name = "lza09";
      user.email = "lza09@proton.me";

      init.defaultBranch = "main";

      user.signingkey = "EB9ED80F781813B7";
      commit.gpgsign = true;
    };
  };
}
