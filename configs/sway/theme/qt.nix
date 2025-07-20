{ pkgs, lib, ... }:
let
  qtConf = {
    Appearance = {
      custon_palette = false;
      icon_theme = "pixelitos-light";
      standart_dialogs = false;
      style = "Windows";
    };
    Fonts = {
      fixed = "\"DepartureMono Nerd Font Mono,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular\"";
      general = "\"DepartureMono Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular\"";
    };
  };
in {
  home.packages = with pkgs; [
    libsForQt5.qt5ct
    qt6ct
  ];
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
  };
  xdg.configFile."qt6ct/qt6ct.conf".text = lib.generators.toINI { } qtConf;
}