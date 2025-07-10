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
  wayland.windowManager.sway.config = {
    startup = [
      {command = "exec ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-A-1 --primary"; always = true;}
    ];
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