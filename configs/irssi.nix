{
  programs.irssi.enable = true;
  programs.irssi.networks = {
    liberachat = {
      nick = "uc73";
      server = {
          address = "irc.libera.chat";
          port = 6697;
      };
      channels = {
        libera.autoJoin = true;
        librejokes.autoJoin = true;
      };
    };
  };
}