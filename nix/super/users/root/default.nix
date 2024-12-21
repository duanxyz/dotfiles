{
  inputs,
  cell,
  pkgs,
}: let
  inherit (inputs) common;
in {
  inherit (common) security;
  users.users.root = {
    initialHashedPassword = "$y$j9T$iOWh.HAibVISIRSGazJnF1$zXxM/ibQJa8TE0hjztAJQ4aQAfWcmk3vxOMRFMHBfA0";
  };
}
