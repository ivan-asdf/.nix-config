{ pkgs, config, ... }:
{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      alsaSupport = true;
      pulseSupport = true;
      githubSupport = true;
      i3Support = true;
    };

    config = ./${config.custom.theme}.ini;
    #script = "polybar bar1 >> /home/ivan/.cache/polybar.log";
    script = "polybar &";
    # this is put at bottom of config
    #extraConfig = builtins.readFile ./latte.ini;

    settings = {
      "bar/bar1" = {
        font = [
          "Symbols Nerd Font:size=16;4"
          "Hack:size=12;4"
          "Noto Color Emoji:scale=8;2"
        ];
        # to make it centered -> detach from i3
        override-redirect = true;
        # to hide it when fullscreen
        wm-restack = "i3";
        width = "100%";
        #offset-x = "1%";
        height = 29;
        padding-right = 1;

        background = "\${colors.background}";
        foreground = "\${colors.text}";

        tray-position = "left";

        seperator = "|";
        module-margin = 2;
        modules-left = "xwindow";
        modules-center = "i3";
        modules-right = "filesystem memory temperature cpu volume date";
      };
      "module/i3" = {
        type = "internal/i3";
        label-focused-background = "\${colors.i3_focused_bg}";
        label-focused-foreground = "\${colors.i3_focused_fg}";
        label-unfocused-background = "\${colors.i3_unfocused_bg}";
        label-unfocused-foreground = "\${colors.i3_unfocused_fg}";
        label-urgent-background = "\${colors.i3_urgent_bg}";
        label-urgent-foreground = "\${colors.i3_urgent_fg}";
        #label-visible-background = "\${colors.warn_foreground}";
        #label-separator = " ";
        #label-separator-padding = 1;
        workspace-label = "%index%";
        label-focused = "\${self.workspace-label}";
        label-unfocused = "\${self.workspace-label}";
        label-urgent = "\${self.workspace-label}";
        label-visible = "\${self.workspace-label}";
        label-focused-padding = 2;
        label-unfocused-padding = 1;
        label-urgent-padding = 1;
        #label-visible-padding = 1;
      };
      "module/xwindow" = {
        type = "internal/xwindow";
      };
      "module/volume" = {
        type = "internal/pulseaudio";
        format.volume = "<ramp-volume> <label-volume>";
        #label.muted.text = "🔇";
        #ramp.volume = [ "🔈" "🔉" "🔊" ];
        label.muted.text = "󰸈 -- ";
        ramp.volume = [ "󰕿" "󰖀" "󰕾" ];
        click.right = "pavucontrol &";
      };
      "module/cpu" = {
        type = "internal/cpu";
        interval = 0.5;
        # maybe instead colors for ramps?!
        warn-percentage = "90";
        label = "󰍛 %percentage:2%%";
        label-warn = "󰍛 %percentage:2%%";
        ramp-coreload = [ " " "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        ramp-coreload-spacing = 0;
        format = "<label> <ramp-coreload>";
        format-warn = "<label-warn> <ramp-coreload>";
        format-warn-foreground = "\${colors.warn_foreground}";
      };
      "module/date" = {
        type = "internal/date";
        #date = "%y-%m-%d%";
        date = "%a %e %b %Y";
        time = "%H:%M:%S";
        label = " %date%  %time%";
      };
      "module/temperature" = {
        type = "internal/temperature";
        hwmon-path = "/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon1/temp1_input";
        base-temperature = 30;
        warn-temperature = 70;
        ramp = [ "" "" "" "" "" ];
        format = "<ramp> <label>";
        format-warn = "<ramp> <label-warn>";
        format-warn-foreground = "\${colors.warn_foreground}";
      };
      "module/memory" = {
        type = "internal/memory";
        warn-percentage = 90;
        label = " %percentage_used%%"; # (font awesome 6)
        label-warn = " %percentage_used%%";
        format-warn = "<label-warn>";
        #label-warn-foreground = "\${colors.warn_foreground}";
        format-warn-foreground = "\${colors.warn_foreground}";
      };
      "module/filesystem" = {
        type = "internal/fs";
        warn-percentage = 80;
        mount = [ "/" ];
        label-mounted = "󰋊 %percentage_used%%";
        label-warn = "󰋊 %percentage_used%%";
        format-warn = "<label-warn>";
        format-warn-foreground = "\${colors.warn_foreground}";
      };
    };
  };
}

