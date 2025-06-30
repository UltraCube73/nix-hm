{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    package = null;
    initExtra = "${pkgs.fastfetch}/bin/fastfetch";
    historyFileSize = 200;
    shellAliases = {
      ls = "${pkgs.eza}/bin/eza -hl --git";
    };
  };
}