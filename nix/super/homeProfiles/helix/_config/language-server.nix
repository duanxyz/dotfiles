{ pkgs }:
{
  language-server = with pkgs; {
    nixd = {
      command = "${nixd}/bin/nixd";
      args = [
        "--inlay-hints"
        "--semantic-tokens"
      ];
      config.option = {
        nixos.expr = "(builtins.getFlake \"/home/duan/dotfiles\").nixosConfigurations.super-semar.options";
        home-manager.expr = "(builtins.getFlake \"/home/duan/dotfiles\").nixosConfigurations.super-semar.config.home-manager.users.duan";
      };
    };
    fish-lsp = {
      command = "${fish-lsp}/bin/fish-lsp";
    };
  };
}
