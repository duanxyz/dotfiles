{
  inputs,
  cell,
}: let
  inherit (inputs.nixpkgs) pkgs;
  defaultPlugins = with pkgs.fishPlugins; [
    {
      name = "hydro";
      src = hydro.src;
    }
    {
      name = "z";
      src = z.src;
    }
    {
      name = "autopair";
      src = autopair.src;
    }
    {
      name = "sponge";
      src = sponge.src;
    }
    {
      name = "done";
      src = done.src;
    }
  ];
in {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # autostart fish_ssh_agent
      fish_ssh_agent
    '';
    plugins = with cell.packages.default;
      [
        {
          name = fisher.pname;
          src = fisher.src;
        }
        {
          name = fish-ssh-agent.pname;
          src = fish-ssh-agent.src;
        }
      ]
      ++ defaultPlugins;
  };
}
