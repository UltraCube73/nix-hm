{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fortune
    cowsay
    lolcat
    tree
    btop
    librewolf
    filezilla
    qbittorrent
    vlc
    keepassxc
  ];
}
