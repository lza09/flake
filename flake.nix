{
  description = "Ice Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, lanzaboote, ... }@inputs: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./hardware-configuration.nix

          ./configs/common.nix
          ./configs/desktop.nix
          ./configs/laptop.nix

          ./programs/kde.nix
          ./programs/git.nix
          ./programs/java.nix
        ];
      };
    };
  };
}
