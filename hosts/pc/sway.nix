{ pkgs, ... }:
let
  left = "h";
  down = "j";
  up = "k";
  right = "l";
  orange = "#ffc814";
  white = "#ffffff";
  black = "#000000";
  background = pkgs.stdenvNoCC.mkDerivation {
    name = "wallpaper";
    src = ./.;
    dontUnpack = true;
    installPhase = ''
      cp $src/wallpaper.png $out
    '';
  };
in {
  wayland.windowManager.sway = {
    enable = true;
    package = null;
    config = rec {
      modifier = "Mod4";
      terminal = "foot"; 
      # keybindings = [];
      startup = [
        #{command = "spectacle";}
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
      window = {
        border = 0;
        titlebar = false;
      };
      floating = {
        border = 2;
      };
      colors = rec {
        focused = {
          background = orange;
          border = orange;
          childBorder = orange;
          indicator = orange;
          text = black;
        };
        focusedInactive = {
          background = white;
          border = white;
          childBorder = white;
          indicator = white;
          text = black;
        };
        unfocused = focusedInactive;
      };
      bars = [{
        position = "top";
        command = "swaybar";
        fonts = {
          size = 10.0;
        };
        statusCommand = "while date +'%Y-%m-%d %X'; do sleep 1; done";
        colors = rec {
          statusline = "#000000";
          background = "#ffffff";
          focusedWorkspace = {
            border = orange;
            background = orange;
            text = "#000000"; 
          };
          activeWorkspace = {
            border = "#ffffff";
            background = "#ffffff";
            text = "#000000";
          };
          inactiveWorkspace = activeWorkspace;
        };
      }];
      keybindings = {
        "${modifier}+d" = "exec ${pkgs.rofi-wayland}/bin/rofi -show drun";
        "${modifier}+Return" = "exec ${pkgs.kitty}/bin/kitty";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+e" = "swaymsg exit";
        "${modifier}+${left}" = "focus left";
        "${modifier}+${down}" = "focus down";
        "${modifier}+${up}" = "focus up";
        "${modifier}+${right}" = "focus right";
        "${modifier}+Left" = "focus left";
        "${modifier}+Down" = "focus down";
        "${modifier}+Up" = "focus up";
        "${modifier}+Right" = "focus right";
        "${modifier}+Shift+${left}" = "move left";
        "${modifier}+Shift+${down}" = "move down";
        "${modifier}+Shift+${up}" = "move up";
        "${modifier}+Shift+${right}" = "move right";
        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Right" = "move right";
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";
        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";
        "${modifier}+b" = "splith";
        "${modifier}+v" = "splitv";
        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";
        "${modifier}+f" = "fullscreen";
        "${modifier}+Shift+space" = "floating toggle";
        "${modifier}+space" = "focus mode_toggle";
        "${modifier}+a" = "focus parent";
        #"${modifier}+Shift+minus" = "move scratchpad";
        #"${modifier}+minus" = "scratchpad show";
      };
    };
  };
}
# eza
# nms