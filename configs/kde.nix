{ pkgs, lib, ... }:
{

  home.packages = with pkgs; [
    papirus-icon-theme
  ];

  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      iconTheme = "Papirus-Dark";
      #wallpaper = "";
    };

    session = {
      sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    };
  };
}
