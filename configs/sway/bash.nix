{ pkgs, ... }:
{
  programs.bash.shellAliases = {
    tty-clock = "${pkgs.tty-clock}/bin/tty-clock -c -C 3";
    cmatrix = "${pkgs.cmatrix}/bin/cmatrix -C yellow";
  };
}