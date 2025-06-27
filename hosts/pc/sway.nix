{ pkgs, ... }:
{
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
      bars = [{
        position = "top";
        command = "swaybar";
        statusCommand = "while date +'%Y-%m-%d %X'; do sleep 1; done";
        colors = {
          statusline = "#007df1";
          background = "#ffffff";
          activeWorkspace = rec {
            border = "#ffc814";
            background = border;
            text = "#ffffff"; 
          };
          inactiveWorkspace = {
            border = "#32323200";
            background = "#32323200";
            text = "#5c5c5c";
          };
        };
      }];
    };
  };
}