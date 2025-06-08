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

    panels = [
      {
        location = "top";
        widgets = [
          {
            kickoff = {
              sortAlphabetically = true;
              icon = "nix-snowflake";
            };
          }
          {
            iconTasks = {
              launchers = [
                "applications:org.kde.konsole.desktop"
                "applications:org.kde.dolphin.desktop"
                "applications:librewolf.desktop"
                "applications:codium.desktop"
                "applications:org.telegram.desktop.desktop"
              ];
            };
          }
          {
            systemTray.items = {
             shown = [
                "org.kde.plasma.bluetooth"
              ];
             hidden = [];
            };
          }
          {
            digitalClock = {};
          }
        ];
      }
    ];
  };
}
