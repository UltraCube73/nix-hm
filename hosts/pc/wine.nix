{ pkgs, ... }:
{
  home-pacages = with pkgs; [
    wineWow64Packages.waylandFull
  ];
}