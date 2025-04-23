{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
    ];
    username = "shooter";
    homeDirectory = "/home/shooter";
    stateVersion = "24.11";
  };
}
