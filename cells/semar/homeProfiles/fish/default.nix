let
  inherit (inputs.unstable) pkgs;
in {
  home.packages = with pkgs.fishPlugins; [
    hydro
    z
    autopair
    sponge
    done
  ];

  programs.fish = {
    enable = true;
    plugins = with cell.packages.default; [
      # {
      #   name = "gitnow";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "joseluisq";
      #     repo = "gitnow";
      #     rev = "2.11.0";
      #     fetchSubmodules = false;
      #     sha256 = "sha256-eImCiEhhbXOkwQqRgpqw481i0Wg4c5nADQlG/O+OH0E=";
      #   };
      # }
      {
        name = fisher.pname;
        src = fisher.src;
      }
      {
        name = fish-ssh-agent.pname;
        src = fish-ssh-agent.src;
      }
    ];
  };
}
