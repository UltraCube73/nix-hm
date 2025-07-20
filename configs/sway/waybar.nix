{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    playerctl
  ];
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 25;
        output = lib.mkDefault [ "*" ];
        modules-left = [ "sway/workspaces" ];
        modules-center = [ "sway/window" ];
        modules-right = [ "mpris" "tray" "sway/language" "cpu" "memory" "network" "battery" "systemd-failed-units" "clock" ];
        "sway/workspaces" = {
          disable-scroll = true;
          disable-click = true;
        };
        tray = {
          spacing = 5;
        };
        cpu = {
          format = " {usage}%";
          interval = 2;
        };
        memory = {
          format = " {}%";
          interval = 2;
        };
        #systemd-failed-units.hide-on-ok = false;
        systemd-failed-units.format = "✗ {nr_failed}";
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
          format-ethernet = "{ipaddr}";
          format-wifi = " {essid} {signalStrength}% {ipaddr}";
          format-disconnected = "no link";
        };
      };
    };
  };
}