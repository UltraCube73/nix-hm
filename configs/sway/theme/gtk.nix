{ pkgs, ... }:
let
  gtk-theme = pkgs.stdenvNoCC.mkDerivation {
    pname = "greymond-theme";
    version = "master";
    src = pkgs.fetchFromGitHub {
      owner = "parhelion22";
      repo = "xfce-theme-greymond";
      rev = "ec2570a09ea73519f40d06e4e1ff219ad7e2bbb7";
      hash = "sha256-+lSjqQszAPdo+0eGUDh8SehvqHbvmWz5HozvtTyFQXk=";
    };
    installPhase = ''
      mkdir -p $out/share/themes
      cp -r ./src/Greymond $out/share/themes/Greymond
      cp -r ./src/"Greymond Classic"/* $out/share/themes/Greymond
    '';
  };
in {
  home.packages = [
    gtk-theme
  ];
  gtk = {
    font = {
      name = "DepartureMono Nerd Font";
      size = 10;
    };
    enable = true;
    iconTheme.name = "pixelitos-light";
    theme.name = "Greymond";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = false;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = false;
  };
  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-light";
}