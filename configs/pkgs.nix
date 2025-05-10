{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    #
  ];

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
    fractal
    openttd
    krita
    blender
    obs-studio
    libreoffice-still
    dbeaver-bin
    unar
    p7zip
    qrcode
    ldns
    tor-browser-bundle-bin
  ];
}
