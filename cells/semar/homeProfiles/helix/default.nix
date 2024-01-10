{
  inputs,
  cell,
}: let
  inherit (inputs.nixpkgs) pkgs lib;
in {
  xdg.configFile."helix/themes".source = ./_config/themes;

  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
      nil
      taplo
      yaml-language-server
      tree-sitter
      nodePackages.bash-language-server
      nodePackages.vscode-css-languageserver-bin
      nodePackages.vscode-langservers-extracted
      shellcheck
    ];

    settings = {
      theme = "nord";
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
      language = let
        prettier = lang: {
          command = "${pkgs.nodePackages.prettier}/bin/prettier";
          args = ["--parser" lang];
        };
        prettierLangs = map (e: {
          name = e;
          formatter = prettier e;
        });
        langs = ["css" "scss" "json" "html"];
      in
        [
          {
            name = "bash";
            auto-format = true;
            formatter = {
              command = "${pkgs.shfmt}/bin/shfmt";
              args = ["-i" "2"];
            };
          }
        ]
        ++ prettierLangs langs;
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

        bash-language-server = {
          command = "${pkgs.nodePackages.bash-language-server}/bin/bash-language-server";
          args = ["start"];
        };

        vscode-css-language-server = {
          command = "${pkgs.nodePackages.vscode-css-languageserver-bin}/bin/css-languageserver";
          args = ["--stdio"];
          config = {
            provideFormatter = true;
            css.validate.enable = true;
          };
        };
      };
    };
  };
}
