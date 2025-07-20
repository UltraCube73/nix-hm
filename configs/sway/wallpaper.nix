{ pkgs, ... }:
{
  config.lib.wallpaper = pkgs.stdenvNoCC.mkDerivation {
    name = "wallpaper";
    src = ./.;
    dontUnpack = true;
    installPhase = ''
      cp $src/wallpaper.png $out
    '';
  };
}