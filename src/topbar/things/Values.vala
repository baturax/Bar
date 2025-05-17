namespace Values {
   public class Main {
      public const int WIDTH                       = 1910;
      public const int HEIGHT                      = -1;
   }

   public class Workspaces {
      public const string WS_COMMAND               = "niri msg action focus-workspace ";
      public const string WS_ONE                   = "1";
      public const string WS_BUTTON_ONE            = "";
      public const string WS_TWO                   = "2";
      public const string WS_BUTTON_TWO            = "";
      public const string WS_THREE                 = "3";
      public const string WS_BUTTON_THREE          = "󰍳";
      public const string WS_FOUR                  = "4";
      public const string WS_BUTTON_FOUR           = "";
      public const string WS_FIVE                  = "5";
      public const string WS_BUTTON_FIVE           = "";
      public const string WS_SIX                   = "6";
      public const string WS_BUTTON_SIX            = "";
   }

   public class Window {
      public const string APP_COMMAND              = "niri msg -j focused-window";
   }

   public class Time {
      public const string CLOCK_IMAGE              = " ";
      public const string CLOCK_FORMAT             = "%H.%M";
      public const string CLOCK_TOOLTIP_FORMAT     = "%A, %B %d, %Y (%H.%M)";
   }

   public class Battery {
      public const string BATTERY_FILE             = "/sys/class/power_supply/BAT0/capacity";
      public const string CHARGE_STATUS            = "/sys/class/power_supply/BAT0/status";
   }

   public class Volume {
      public const string GET_VOLUME               = "sh -c \"wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print \\$2, $3}'\"";
      public const string INCREASE_VOLUME          = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01+";
      public const string DECREASE_VOLUME          = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01-";
      public const string TOGGLE_MUTE_VOLUME       = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      public const string VOLUME_APP               = "pavucontrol";
   }

   public class Shortcuts {
      public const string FILE_MANAGER             = "nautilus";
      public const string FILE_MANAGER_ICON_NAME   = "system-file-manager";
      public const string TERMINAL                 = "alacritty";
      public const string TERMINAL_ICON_NAME       = "utilities-terminal";
      public const string BROWSER                  = "firefox";
      public const string BROWSER_ICON_NAME        = "applications-internet";
   }

   public class Music {
      public const string MUSIC_COMMAND = """playerctl metadata --format "{{ artist }} - {{ title }}"""";
      public const string TOGGLE_MUSIC = "playerctl play-pause";
      public const string NEXT_MUSIC = "playerctl next";
      public const string PREV_MUSIC = "playerctl previous";
   }

   public class Css {
      public const string CSS_FILE = "/home/bai/Projects/baturax/bai-bar/src/topbar/Bar.css";
   }

}
