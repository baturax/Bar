namespace Values {
        //  main.vala
    public const string APP_ID = "bai.bai.Bar.Top";
    
        //  show_time.vala
    public const string CLOCK_FORMAT = "%H.%M.%S";
    
        //  to_workspace.vala
    public const string WORKSPACE_CHANGE = "hyprctl dispatch workspace ";
    public const string WORKSPACE_CHANGE_NOTIFICATION = "hyprctl notify 5 5000 0 Switched to Workspace";
    public const string NOTIFICATION_ERROR = "Use Hyprland bruh";
    
        //  what_app_is_open.vala
    public const string GET_OPEN_APP = "/bin/sh -c 'hyprctl activewindow | grep class: | sed \"s/class: //\"'";
    
        //  battery.vala
    public const string BATTERY_CAPACITY_FILE = "/sys/class/power_supply/BAT0/capacity";
    public const string BATTERY_STATUS_FILE = "/sys/class/power_supply/BAT0/status";
}
