{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fortune
    cowsay
    lolcat
    tree
    btop
    filezilla
    qbittorrent
    vlc
    keepassxc
    telegram-desktop
  ];
}
