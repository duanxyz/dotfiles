{
  inputs,
  cell,
}: {
  default = cell.lib.callSource "${inputs.self}/packages/generated.nix" {};
}
