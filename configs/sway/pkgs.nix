{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pcmanfm-qt
    kdePackages.ark
  ];
}