{
  description = "My home-manager config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = inputs@{ nixpkgs, home-manager, plasma-manager, catppuccin, ... }:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    baseModules = [
      ./home.nix
      ./configs/shared
      plasma-manager.homeManagerModules.plasma-manager
      catppuccin.homeModules.catppuccin
    ];
  in {
    homeConfigurations = {
      "shooter@pc" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = baseModules ++ [
          ./configs/sway
          ./hosts/pc
        ];
      };
      "shooter@nb" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = baseModules ++ [
          ./configs/sway
        ];
      };
    };
  };
}
