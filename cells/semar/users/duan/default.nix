{
  inputs,
  cell,
}: let
  inherit (inputs.nixpkgs) pkgs;
in {
  users.users.duan = {
    initialHashedPassword = "$y$j9T$iOWh.HAibVISIRSGazJnF1$zXxM/ibQJa8TE0hjztAJQ4aQAfWcmk3vxOMRFMHBfA0";
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };
}
