{ pkgs, ... }:
let
  background = pkgs.stdenvNoCC.mkDerivation {
    name = "wallpaper";
    src = ./.;
    dontUnpack = true;
    installPhase = ''
      cp $src/wallpaper.png $out
    '';
  };
in
{
  programs.plasma.workspace.wallpaper = background;
  programs.plasma.kscreenlocker.appearance.wallpaper = background;
}