{ pkgs, ... }:
let
  orange = "#ffc814";
  background = pkgs.stdenvNoCC.mkDerivation {
    name = "wallpaper";
    src = ./.;
    dontUnpack = true;
    installPhase = ''
      cp $src/wallpaper.png $out
    '';
  };
in {
  programs.waybar.settings.mainBar.output = [ "HDMI-A-1" ];
  programs.waybar.settings.secondBar = {
    layer = "top";
    position = "top";
    height = 25;
    output = [ "DP-1" ];
    modules-left = [ "sway/workspaces" "sway/mode" ];
    modules-center = [ "sway/window" ];
  };
  wayland.windowManager.sway.config = {
    output = {
      HDMI-A-1 = {
        bg = "${background} fill";
        res = "1920x1080";
        pos = "1280 0";
      };
      DP-1 = {
        bg = "${orange} solid_color";
        res = "1280x1024";
        pos = "0 0";
      };
    };
    workspaceOutputAssign = [
      { output = "DP-1"; workspace = "1"; }
      { output = "DP-1"; workspace = "2"; }
      { output = "DP-1"; workspace = "3"; }
      { output = "DP-1"; workspace = "4"; }
      { output = "DP-1"; workspace = "5"; }
      { output = "HDMI-A-1"; workspace = "6"; }
      { output = "HDMI-A-1"; workspace = "7"; }
      { output = "HDMI-A-1"; workspace = "8"; }
      { output = "HDMI-A-1"; workspace = "9"; }
      { output = "HDMI-A-1"; workspace = "10"; }
    ];
    defaultWorkspace = "workspace number 6";
  };
}