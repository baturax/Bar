using Gtk;
using GLib;

public static Label get_battery_capacity(Label battery_capacity) {
    string stdout;
    try {
        FileUtils.get_contents(Values.BATTERY_STATUS_FILE, out stdout);
        battery_capacity.set_label(stdout);
    } catch (FileError e) {
        battery_capacity.set_label("nnnnnigga");
    }
    return battery_capacity;
}