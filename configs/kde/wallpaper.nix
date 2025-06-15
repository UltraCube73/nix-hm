{ pkgs, ... }:
let
  background-package = pkgs.stdenvNoCC.mkDerivation {
    name = "kde-wallpaper";
    src = ./.;
    dontUnpack = true;
    installPhase = ''
      cp $src/wallpaper.png $out
    '';
  };
in
{
  programs.plasma.workspace.wallpaper = background-package;
  programs.plasma.kscreenlocker.appearance.wallpaper = background-package;
}