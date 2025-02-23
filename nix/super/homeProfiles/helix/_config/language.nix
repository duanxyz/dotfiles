{
  pkgs,
  lib,
}:
let
  # Helper functions
  prettier = lang: {
    command = "${pkgs.nodePackages.prettier}/bin/prettier";
    args = [
      "--parser"
      lang
    ];
  };

  # Base language configuration
  mkLanguage =
    {
      name,
      formatter ? null,
      auto-format ? true,
      language-servers ? null,
      ...
    }:
    {
      inherit name auto-format;
      formatter = if formatter != null then formatter else prettier name;
    }
    // (if language-servers != null then { inherit language-servers; } else { });

  # Language definitions
  languageConfigs = with pkgs; {
    bash = {
      formatter = {
        command = "${shfmt}/bin/shfmt";
        args = [
          "-i"
          "2"
        ];
      };
    };
    fish = {
      language-servers = [ "fish-lsp" ];
    };
    nix = {
      formatter = {
        command = "${nixfmt-rfc-style}/bin/nixfmt";
        args = [ "-q" ];
      };
      language-servers = [
        "nixd"
        "nil"
      ];
    };
    toml = {
      formatter = {
        command = "${taplo}/bin/taplo";
        args = [
          "fmt"
          "-"
        ];
      };
    };
  };

  # Prettier-supported languages
  prettierLanguages = [
    "css"
    "scss"
    "json"
    "html"
    "yaml"
    "markdown"
  ];
in
{
  language =
    (lib.attrValues (
      lib.mapAttrs (
        name: cfg:
        mkLanguage (
          {
            inherit name;
          }
          // cfg
        )
      ) languageConfigs
    ))
    ++ (map (
      name:
      mkLanguage {
        inherit name;
        auto-format = true;
      }
    ) prettierLanguages);
}
