{
  programs.waybar.style = ''
    * {
        font-family: "DepartureMono Nerd Font";
        font-size: 13px;
        color: #000000;
    }

    window#waybar {
        background-color: #ffffff;
        border-bottom: 3px solid #000000;
    }

    button {
        box-shadow: inset 0 -3px transparent;
        border: none;
        border-radius: 0;
    }

    button:hover {
        background: inherit;
        box-shadow: inherit;
    }

    #workspaces button {
        padding: 0 3px;
        background-color: transparent;
        color: #ffffff;
    }

    #workspaces button.visible {
        box-shadow: inset 0px 0px 0px 3px #000000;
    }

    #workspaces button.urgent {
        background-color: #eb4d4b;
    }

    #mode {
        background-color: #64727D;
        box-shadow: inset 0 -3px #ffffff;
    }

    #clock,
    #battery,
    #cpu,
    #memory,
    #network,
    #tray,
    #mpris,
    #language {
        padding: 0 7px 0 10px;
        color: #000000;
        box-shadow: inset 0 3px 0 #000000, inset 3px 0 0 #000000, inset 0 -3px 0 #000000;
    }

    #window,
    #workspaces {
        margin: 0 4px;
    }

    /* If workspaces is the leftmost module, omit left margin */
    .modules-left > widget:first-child > #workspaces {
        margin-left: 0;
    }

    /* If workspaces is the rightmost module, omit right margin */
    .modules-right > widget:last-child > #workspaces {
        margin-right: 0;
    }

    #clock {
        background-color: #000000;
        color: #ffffff
    }

    #battery {
        background-color: #ffffff;
        color: #000000;
    }

    #battery.charging, #battery.plugged {
        color: #ffffff;
        background-color: #26A65B;
    }

    @keyframes blink {
        to {
            background-color: #ffffff;
            color: #000000;
        }
    }

    /* Using steps() instead of linear as a timing function to limit cpu usage */
    #battery.critical:not(.charging) {
        background-color: #f53c3c;
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: steps(12);
        animation-iteration-count: infinite;
        animation-direction: alternate;
    }

    label:focus {
        background-color: #000000;
    }

    #cpu {
        background-color: #2ecc71;
    }

    #memory {
        background-color: #9b59b6;
    }

    #backlight {
        background-color: #90b1b1;
    }

    #network {
        background-color: #2980b9;
    }

    #network.disconnected {
        background-color: #f53c3c;
    }

    #tray {
        background-color: #2980b9;
    }

    #tray > .passive {
        -gtk-icon-effect: dim;
    }

    #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: #eb4d4b;
    }

    #language {
        background: #00b093;
        margin: 0px;
    }
  '';
}