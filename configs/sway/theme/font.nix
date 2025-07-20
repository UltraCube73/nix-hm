{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.departure-mono
    nerd-fonts.droid-sans-mono
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = rec {
      serif = ["DepartureMono Nerd Font"];
      monospace = ["DepartureMono Nerd Font Mono"];
      sansSerif = serif;
      emoji = serif;
    };
  };
  programs.vscode.profiles.default.userSettings."editor.fontFamily" = "'DroidSansM Nerd Font Mono', 'monospace', monospace";
  programs.vscode.profiles.default.userSettings."terminal.integrated.fontSize" = 12;
}