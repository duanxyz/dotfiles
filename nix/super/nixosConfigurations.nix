{
  inputs,
  cell,
}: let
  bee = {
    system = "x86_64-linux";
    home = inputs.home-manager;
    pkgs = import inputs.nixpkgs {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [
        inputs.ragenix.overlays.default
      ];
    };
  };
in
  inputs.hive.findLoad {
    inherit cell;
    inputs = inputs // {inherit bee;};
    block = ./hosts;
  }
