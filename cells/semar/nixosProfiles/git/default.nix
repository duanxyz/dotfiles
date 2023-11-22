{
  inputs,
  cell,
}: {
  programs.git = {
    enable = true;
    lfs.enable = true;

    config = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
    };
  };
}
