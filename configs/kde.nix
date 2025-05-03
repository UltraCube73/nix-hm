{ pkgs, lib, ... }:
{

  home.packages = with pkgs; [
    papirus-icon-theme
  ];

  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      iconTheme = "Papirus-Dark";
      #wallpaper = "";
    };

    session = {
      sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    };

    powerdevil = {
      AC = {
        powerButtonAction = "lockScreen";
        autoSuspend = {
          action = "nothing";
        };
        turnOffDisplay = {
          idleTimeout = 300;
          idleTimeoutWhenLocked = "immediately";
        };
      };
      battery = {
        autoSuspend = {
          action = "sleep";
          idleTimeout = 300;
        };
        turnOffDisplay = {
          idleTimeout = 200;
          idleTimeoutWhenLocked = "immediately";
        };
        powerButtonAction = "sleep";
        whenSleepingEnter = "standbyThenHibernate";
      };
      lowBattery = {
        whenLaptopLidClosed = "hibernate";
      };
    };
  };
}
