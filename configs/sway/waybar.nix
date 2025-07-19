{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    playerctl
    nerd-fonts.departure-mono
    nerd-fonts.ubuntu
  ];
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
        modules-right = [ "mpris" "tray" "sway/language" "cpu" "memory" "network" "battery" "systemd-failed-units" "clock" ];
        tray = {
          spacing = 5;
        };
        cpu = {
          format = " {}%";
          interval = 2;
        };
        memory.interval = 2;
        mpris = {
          format = "{status_icon} {artist} - {title}";
          status-icons = {
            paused =  "⏸";
            playing = "▶";
            stopped = "⏹";
          };
        };
        network = {
          interval = 2;
          format-ethernet = "⇅ {bandwidthDownBytes} {bandwidthUpBytes}";
          format-wifi = "{essid} {signalStrength}% ⇅ {bandwidthDownBytes} {bandwidthUpBytes}";
          format-disconnected = "no link";
        };
      };
    };
  };
}