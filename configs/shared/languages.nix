{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dotnet-ef
    dotnetPackages.Nuget
    dotnet-sdk_9
    dotnet-aspnetcore_9
  ];
}
