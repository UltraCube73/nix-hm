{ pkgs, lib, ... }:
{
  services.mpd.enable = true;
  services.mpdris2.enable = true;
  xdg.userDirs.enable = true;
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 25;
        output = lib.mkDefault [ "*" ];
        modules-left = [ "sway/workspaces" "sway/mode" ];
        modules-center = [ "sway/window" ];
        modules-right = [ "mpd" "tray" "cpu" "memory" "battery" "clock" ];
        tray = {
          spacing = 5;
        };
        cpu.interval = 2;
        memory.interval = 2;
      };
    };
  };
}