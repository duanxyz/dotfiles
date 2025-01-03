{
  description = "The Hive - The secretly open NixOS-Society";

  inputs = {
    hive = {
      url = "github:divnix/hive";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    std = {
      url = "github:divnix/std";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  inputs = {
    nixpkgs.follows = "nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  inputs = {
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {
    self,
    std,
    hive,
    ...
  } @ inputs:
    hive.growOn {
      inherit inputs;

      systems = [
        "x86_64-linux"
      ];

      cellsFrom = ./nix;

      cellBlocks = with std.blockTypes;
      with hive.blockTypes; [
        # profiles activate
        (functions "hardwareProfiles")
        (functions "nixosProfiles")
        (functions "homeProfiles")

        #
        (functions "users")

        # configurations can be deployed
        nixosConfigurations
        # homeConfigurations
        diskoConfigurations
      ];
    }
    {
      nixosConfigurations = hive.collect self "nixosConfigurations";
      diskoConfigurations = hive.collect self "diskoConfigurations";
    };

  nixConfig = {
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://hyprland.cachix.org"
      "https://cache.garnix.io"
      "https://cache.nixos.org/"
    ];
    extra-trusted-substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://hyprland.cachix.org"
      "https://cache.garnix.io"
      "https://nix-community.cachix.org"
      "https://nixos-cn.cachix.org"
      "https://nixpkgs-wayland.cachix.org"
      "https://numtide.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nixos-cn.cachix.org-1:L0jEaL6w7kwQOPlLoCR3ADx+E3Q8SEFEcB9Jaibl0Xg="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
    ];
  };
}
