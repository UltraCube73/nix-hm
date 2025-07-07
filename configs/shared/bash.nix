{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    package = null;
    bashrcExtra = "${pkgs.fastfetch}/bin/fastfetch";
    historyFileSize = 200;
    shellAliases = {
      ls = "${pkgs.eza}/bin/eza -hlg --git --icons=auto";
    };
  };

  programs.powerline-go.enable = true;
}