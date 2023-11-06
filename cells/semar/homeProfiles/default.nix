{
  inputs,
  cell,
}: let
  inherit
    (inputs)
    nixpkgs-unstable
    nixpkgs
    ;
  unstable =
    import nixpkgs-unstable
    {
      inherit (nixpkgs) system;
      config.allowUnfree = true;
    };
in
  inputs.hive.findLoad {
    inherit cell;
    block = ./.;
    inputs = inputs // {inherit unstable;};
  }
