using Gtk;
using GLib;

public static Label get_battery_capacity() {
    var battery_capacity = new Gtk.Label("");
    battery_capacity.set_valign(Gtk.Align.CENTER);
    GLib.Timeout.add_seconds(5, () => {
    string stdout;
    try {
        FileUtils.get_contents(Values.BATTERY_STATUS_FILE, out stdout);
        battery_capacity.set_label(stdout.strip());
    } catch (FileError e) {
        battery_capacity.set_label("nnnnnigga");
    }
    return true;
    });
    return battery_capacity;
}