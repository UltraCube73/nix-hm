{
  programs.fastfetch = {
    enable = true;
    settings = {
      display.separator = " > ";
      modules = [
        {
          "type" = "custom";
          "format" = "┌──────────────────────────────────────────┐";
        }
        {
          "type" = "title";
          "key" = "   User";
          "format" = "{6} {7} {8}";
        }
        {
          "type" = "kernel";
          "key" = "   Kernel";
          "format" = "{2}";
          "keyColor" = "red";
        }
        {
          "type" = "packages";
          "key" = "  󰏗 Packages";
          "keyColor" = "green";
        }
        {
          "type" = "display";
          "key" = "  󰍹 Display";
          "format" = "{1}x{2} @ {3}Hz [{7}]";
          "keyColor" = "green";
        }
        {
          "type" = "terminal";
          "key" = "  >_ Terminal";
          "keyColor" = "yellow";
        }
        {
          "type" = "wm";
          "key" = "   WM";
          "format" = "{2}";
          "keyColor" = "yellow";
        }
        {
          "type" = "cpu";
          "format" = "{1} @ {7}";
          "key" = "   CPU";
          "keyColor" = "blue";
        }
        {
          "type" = "gpu";
          "format" = "{1} {2}";
          "key" = "  󰻑 GPU";
          "keyColor" = "blue";
        }
        {
          "type" = "memory";
          "key" = "    Memory";
          "keyColor" = "magenta";
        }
        {
          "type" = "command";
          "key" = "  󱦟 OS Age ";
          "keyColor" = "red";
          "text" = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          "type" = "uptime";
          "key" = "  󱫐 Uptime ";
          "keyColor" = "red";
        }
        {
          "type" = "custom";
          "format" = "└──────────────────────────────────────────┘";
        }
        {
          "type" = "colors";
          "paddingLeft" = 2;
          "symbol" = "circle";
        }
      ];
    };
  };
}