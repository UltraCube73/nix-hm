{ pkgs, lib, ... }:
{
  allowedUnfree = [
    "discord"
  ];
  home.packages = with pkgs; [
    discord
  ];
}