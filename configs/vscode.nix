{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      ms-dotnettools.csharp
      ms-dotnettools.vscode-dotnet-runtime
    ];
  };
}
