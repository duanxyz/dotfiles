{
  inputs,
  cell,
}: {
  imports = [inputs.ragenix.homeManagerModules.default];

  home.packages = with pkgs; [
    agenix
  ];
}
