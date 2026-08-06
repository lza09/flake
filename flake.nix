{
  description = "Ice Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  {
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

          ./programs
        ];
      };
    };
  };
}
