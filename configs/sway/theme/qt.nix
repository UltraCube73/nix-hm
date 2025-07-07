{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libsForQt5.qt5ct
    qt6ct
  ];
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    style = {
      name = "qt6ct-style";
      package = pkgs.kdePackages.breeze;
    };
  };
}