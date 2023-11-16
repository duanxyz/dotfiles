let
  inherit (inputs.unstable) pkgs lib;
  helix-wrap = pkgs.symlinkJoin {
    name = "${lib.getName pkgs.helix}-wrapped-${lib.getVersion pkgs.helix}";
    paths = [pkgs.helix];
    preferLocalBuild = true;
    nativeBuildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/hx \
        --prefix PATH : ${lib.makeBinPath [
        pkgs.nil
        pkgs.taplo
        pkgs.yaml-language-server
        pkgs.tree-sitter
      ]}
    '';
  };
in {
  xdg.configFile."helix/themes".source = ./_config/themes;

  programs.helix = {
    enable = true;
    package = helix-wrap;

    settings = {
      theme = "gruvbox_material_dark_medium";
      editor = {
        color-modes = true;
        cursorline = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides = {
          render = true;
        };
        lsp.display-inlay-hints = true;
        statusline.center = ["position-percentage"];
        true-color = true;
        whitespace.characters = {
          newline = "↴";
          tab = "⇥";
        };
      };
      keys.normal.space.u = {
        f = ":format"; # format using LSP formatter
      };
    };

    languages = {
      language = [
        {
          name = "bash";
          auto-format = true;
          formatter = {
            command = "${pkgs.shfmt}/bin/shfmt";
            args = ["-i" "2"];
          };
        }
      ];
      grammar = [
        {
          name = "nix";
          source = pkgs.tree-sitter-grammars.tree-sitter-nix;
        }
      ];
      language-server = {
        nil = {
          command = lib.getExe pkgs.nil;
          config.nil.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
        };
      };
    };
  };
}
