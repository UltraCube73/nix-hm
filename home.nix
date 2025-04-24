{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
      fortune
      cowsay
      lolcat
      git
    ];
    username = "shooter";
    homeDirectory = "/home/shooter";
    stateVersion = "24.11";
  };
}
