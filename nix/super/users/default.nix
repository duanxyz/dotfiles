{
  inputs,
  cell,
}: let
  inherit (inputs.nixpkgs) pkgs;
  common = {
    security.sudo = {
      enable = true;
      extraRules = [
        {
          commands = [
            {
              command = "${pkgs.systemd}/bin/systemctl suspend";
              options = ["NOPASSWD"];
            }
            {
              command = "${pkgs.systemd}/bin/reboot";
              options = ["NOPASSWD"];
            }
            {
              command = "${pkgs.systemd}/bin/poweroff";
              options = ["NOPASSWD"];
            }
          ];
          groups = ["wheel"];
        }
      ];
    };
  };
in
  inputs.hive.findLoad {
    inherit cell;
    inputs = inputs // {inherit common;};
    block = ./.;
  }
