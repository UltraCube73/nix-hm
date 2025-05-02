{ pkgs, ... }:
{
  home.packages = with pkgs; [
    irssi
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
