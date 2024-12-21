{
  services.openssh.enable = true;
  programs.ssh = {
    startAgent = true;
    extraConfig = ''
      # With option enabled keys used by ssh will be automatically added to ssh-agent. No need to call ssh-add.
      AddKeysToAgent yes
    '';
  };
}
