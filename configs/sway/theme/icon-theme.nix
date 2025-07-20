{ pkgs, ... }:
let
  icon-theme = pkgs.stdenvNoCC.mkDerivation {
    pname = "pixelitos-icon-theme";
    version = "master";
    src = pkgs.fetchFromGitHub {
      owner = "ItsZariep";
      repo = "pixelitos-icon-theme";
      rev = "ab8ebe3bf5b3fb2df6b59a684903e694139180d7";
      hash = "sha256-UYt+MG6gQh+7d1mjwYAtpYs5Rhbs/MT+SaNEKBUeOCk=";
    };
    buildInputs = with pkgs; [
      imagemagick
      gtk3
    ];
    installPhase = ''
      patchShebangs pixelitos-dark/compile-icons.sh
      ./pixelitos-dark/compile-icons.sh
      mkdir -p $out/share/icons
      cp -r ./pixelitos-dark $out/share/icons/pixelitos-dark
      cp -r ./pixelitos-light $out/share/icons/pixelitos-light
      mkdir -p $out/share/icons/pixelitos-light/128
      ln -s $out/share/icons/pixelitos-dark/128/actions-light $out/share/icons/pixelitos-light/128/actions
      ln -s $out/share/icons/pixelitos-dark/128/apps $out/share/icons/pixelitos-light/128/apps
      ln -s $out/share/icons/pixelitos-dark/128/categories $out/share/icons/pixelitos-light/128/categories
      ln -s $out/share/icons/pixelitos-dark/128/devices $out/share/icons/pixelitos-light/128/devices
      ln -s $out/share/icons/pixelitos-dark/128/distributor-logo $out/share/icons/pixelitos-light/128/distributor-logo
      ln -s $out/share/icons/pixelitos-dark/128/emblems $out/share/icons/pixelitos-light/128/emblems
      ln -s $out/share/icons/pixelitos-dark/128/mimetypes $out/share/icons/pixelitos-light/128/mimetypes
      ln -s $out/share/icons/pixelitos-dark/128/places $out/share/icons/pixelitos-light/128/places
      ln -s $out/share/icons/pixelitos-dark/128/status $out/share/icons/pixelitos-light/128/status
      ln -s $out/share/icons/pixelitos-dark/128/symbolic-light $out/share/icons/pixelitos-light/128/symbolic
    '';
  };
in {
  home.packages = [
    icon-theme
  ];
}