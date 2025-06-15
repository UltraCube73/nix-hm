{ pkgs, lib, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      userSettings = {
        "editor.tabSize" = "2";
      };
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        ms-dotnettools.csharp
        ms-dotnettools.vscode-dotnet-runtime
      ];
    };
  };
}
