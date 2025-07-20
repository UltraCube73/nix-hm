{ pkgs, lib, ... }:
let
  left = "h";
  down = "j";
  up = "k";
  right = "l";
  orange = "#ffc814";
  white = "#ffffff";
  black = "#000000";
  grey = "#cccccc";
in {
  services.mako = {
    enable = true;
    settings = {
      default-timeout = 10000;
      history = 0;
      background-color = orange;
      border-color = white;
      text-color = black;
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    package = null;
    config = rec {
      modifier = "Mod4";
      terminal = "foot"; 
      startup = [
        {command = "waybar";}
        {command = "${pkgs.wl-clipboard}/bin/wl-paste -t text --watch ${pkgs.clipman}/bin/clipman store --no-persist";}
      ];
      input."*" = {
        xkb_layout = "us,ru";
        xkb_options = "grp:alt_shift_toggle";
      };
      output = lib.mkDefault {
        "*" = {
          bg = "${white} solid_color";
        };
      };
      defaultWorkspace = lib.mkDefault "workspace number 1";
      window = {
        border = 3;
        titlebar = false;
      };
      gaps = {
        outer = 5;
        inner = 5;
      };
      floating = {
        titlebar = false;
        criteria = [
          {class = "Wine";}
        ];
      };
      colors = rec {
        focused = {
          background = white;
          border = black;
          childBorder = black;
          indicator = black;
          text = black;
        };
        focusedInactive = {
          background = grey;
          border = grey;
          childBorder = grey;
          indicator = grey;
          text = black;
        };
        unfocused = focusedInactive;
      };
      bars = [];
      keybindings = {
        "${modifier}+d" = "exec ${pkgs.rofi-wayland}/bin/rofi -show drun";
        "${modifier}+Return" = "exec ${pkgs.kitty}/bin/kitty";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+e" = "exec swaymsg exit";
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
        "${modifier}+Shift+b" = "exec ${pkgs.kitty}/bin/kitty ${pkgs.bluetuith}/bin/bluetuith";
        "${modifier}+Shift+f" = "exec ${pkgs.pcmanfm-qt}/bin/pcmanfm-qt";
        "${modifier}+Shift+n" = "exec ${pkgs.kitty}/bin/kitty nmtui";
        "XF86AudioRaiseVolume" = "exec ${pkgs.pw-volume}/bin/pw-volume change +2.5%";
        "XF86AudioLowerVolume" = "exec ${pkgs.pw-volume}/bin/pw-volume change -2.5%";
        "XF86AudioMute" = "exec ${pkgs.pw-volume}/bin/pw-volume mute toggle";
        #"${modifier}+Shift+minus" = "move scratchpad";
        #"${modifier}+minus" = "scratchpad show";
      };
    };
  };
}
# nms