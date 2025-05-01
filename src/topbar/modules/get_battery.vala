using Gtk;
using GLib;

public static Label get_battery() {
    var battery = new Gtk.Label("");
    battery.set_valign(Gtk.Align.CENTER);
    GLib.Timeout.add_seconds(2, () => {
        string output_;
        try {
            FileUtils.get_contents(Values.BATTERY_CAPACITY_FILE, out output_);
            battery.set_label("%"+output_.strip()+" 󰠏");
        } catch (FileError e) {
            battery.set_label("couldnt find battery, maybe change values?");
        }
        return true;
    });
    return battery;
}