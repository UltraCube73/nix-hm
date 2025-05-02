{
  description = "My home-manager config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
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
  in {
    homeConfigurations.shooter = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home.nix
        ./configs/git.nix
        ./configs/pkgs.nix
        ./configs/kde.nix
        ./configs/vscode.nix
        ./configs/catppuccin.nix
        ./configs/librewolf.nix
        ./configs/irssi.nix
        inputs.plasma-manager.homeManagerModules.plasma-manager
        catppuccin.homeModules.catppuccin
      ];
    };
  };
}
