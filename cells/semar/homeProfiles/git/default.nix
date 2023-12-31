{
  inputs,
  cell,
}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    userEmail = "25993873+duanxyz@users.noreply.github.com";
    userName = "Muhammad Ridwan";
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
    };
  };
}
