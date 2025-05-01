namespace Values {
        //  main.vala
    public const string APP_ID = "bai.bai.Bar.Top";
    
        //  show_time.vala
    public const string CLOCK_FORMAT = "%H.%M.%S";
    
        //  to_workspace.vala
    public const string WORKSPACE_CHANGE = "niri msg action focus-workspace ";
    public const string WORKSPACE_CHANGE_NOTIFICATION = "notify-send --app-name='System' --urgency 'low' --expire-time=2000 -e 'Switched to Workspace' ";
    public const string NOTIFICATION_ERROR = "Did You forget to fix here?";
    
        //  what_app_is_open.vala
    public const string GET_OPEN_APP_OF_HYPRLAND = "/bin/sh -c 'hyprctl activewindow | grep class: | sed \"s/class: //\"'";
    public const string GET_OPEN_APP_OF_NIRI = "/bin/sh -c \"niri msg focused-window | awk 'NR==3 {print $3}'\"";
    public const string GET_OPEN_APP = GET_OPEN_APP_OF_NIRI;
    
        //  battery.vala
    public const string BATTERY_CAPACITY_FILE = "/sys/class/power_supply/BAT0/capacity";
    public const string BATTERY_STATUS_FILE = "/sys/class/power_supply/BAT0/status";
    
        //  Shorcuts
    public const string FILE_MANAGER = "nautilus";
    public const string TERMINAL = "kitty";
    public const string BROWSER = "firefox";
}
