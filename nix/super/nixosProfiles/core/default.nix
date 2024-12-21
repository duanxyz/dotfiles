{
  inputs,
  cell,
  pkgs,
}: {
  environment.systemPackages = with pkgs; [
    wget
    bash
    dash
  ];
}
