{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.departure-mono
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = rec {
      serif = ["DepartureMono Nerd Font"];
      monospace = ["DepartureMono Nerd Font Mono"];
      sansSerif = serif;
      emoji = serif;
    };
  };
}