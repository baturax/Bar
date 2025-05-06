namespace Value {
   class Main {
      public const string APP_ID = "bai.bai.Bar.Top";       // App ID
      public const int WIDTH = 1920;            // Width of monitor
      public const int HEIGHT = -1;             // use -1 for default
      public const string SEPERATOR = "";
   }
   class Music {
      public const string MUSIC_COMMAND = """playerctl metadata --format "{{ artist }} - {{ title }}"""";
      public const string TOGGLE_MUSIC = "playerctl play-pause";
      public const string NEXT_MUSIC = "playerctl next";
      public const string PREV_MUSIC = "playerctl previous";
   }
   class Time {
      public const string CLOCK_FORMAT = "%H.%M";
      public const string CLOCK_TOOLTIP_FORMAT = "%A, %B %d, %Y (%H.%M)";
      public const string CLOCK_IMAGE = "󰥔 ";
   }
   class Battery {
      public const string BATTERY_CAPACITY_FILE = "/sys/class/power_supply/BAT0/capacity";
      public const string BATTERY_STATUS_FILE   = "/sys/class/power_supply/BAT0/status";
   }
}

namespace Values {

//  to_workspace.vala
public const string WORKSPACE_CHANGE_HYPRLAND = "hyprctl dispatch workspace ";
public const string WORKSPACE_CHANGE_NIRI     = "niri msg action focus-workspace ";
public const string WORKSPACE_CHANGE          = WORKSPACE_CHANGE_NIRI;
public const string WORKSPACE_CHANGE_NOTIFICATION_HYPRLAND = "hyprctl notify 5 5000 0 Switched to Workspace ";
public const string WORKSPACE_CHANGE_NOTIFICATION_GLOBAL   = "notify-send -a 'System' -u 'low' -t 2000 -e 'Switched to Workspace ' ";
public const string WORKSPACE_CHANGE_NOTIFICATION          = WORKSPACE_CHANGE_NOTIFICATION_GLOBAL;
public const string NOTIFICATION_ERROR = "Did You forget to fix here?";

//  what_app_is_open.vala
public const string GET_OPEN_APP_OF_HYPRLAND = "/bin/sh -c 'hyprctl activewindow | grep class: | sed \"s/class: //\"'";
public const string GET_OPEN_APP_OF_NIRI     = "/bin/sh -c \"niri msg focused-window | awk 'NR==3 {print $3}'\"";
public const string GET_OPEN_APP             = GET_OPEN_APP_OF_NIRI;

//  battery.vala
public const string BATTERY_CAPACITY_FILE = "/sys/class/power_supply/BAT0/capacity";
public const string BATTERY_STATUS_FILE   = "/sys/class/power_supply/BAT0/status";

//  Shorcuts
public const string FILE_MANAGER           = "nautilus";
public const string TERMINAL               = "kitty";
public const string BROWSER                = "firefox";
public const string FILE_MANAGER_ICON_NAME = "system-file-manager";
public const string TERMINAL_ICON_NAME     = "utilities-terminal";
public const string BROWSER_ICON_NAME      = "applications-internet";

//  Volume
public const string GET_VOLUME = "sh -c \"wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print \\$2, $3}'\"";
public const string VOLUME_APP = "pavucontrol";
public const string INCREASE_VOLUME  = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01+";
public const string DECREASE_VOLUME = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01-";
public const string TOGGLE_MUTE_VOLUME = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

//  Workspaces
public const string WS1_LABEL = "N";
public const string WS2_LABEL = "I";
public const string WS3_LABEL = "R";
public const string WS4_LABEL = "I";
public const string WS5_LABEL = "W";
public const string WS6_LABEL = "M";

public const string WS1 = "1";
public const string WS2 = "2";
public const string WS3 = "3";
public const string WS4 = "4";
public const string WS5 = "5";
public const string WS6 = "6";

}

