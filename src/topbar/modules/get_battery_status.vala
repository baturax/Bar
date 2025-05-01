using Gtk;
using GLib;

public static Label get_battery_status() {
    var battery_capacity = new Gtk.Label("");
    battery_capacity.set_valign(Gtk.Align.CENTER);
    GLib.Timeout.add_seconds(2, () => {
        string output_;
        try {
            FileUtils.get_contents(Values.BATTERY_STATUS_FILE, out output_);
            output_ = output_.strip();
            
            if (output_.contains("Charging")) {
                battery_capacity.set_label("󰚥 " + output_);
            } else if (output_.contains("Disc")) {
                battery_capacity.set_label("󰚦 " + output_);
            } else {
                battery_capacity.set_label("󰂑");
            }
            
        } catch (FileError e) {
            battery_capacity.set_label("Forgot to change value?");
        }
        return true;
    });
    return battery_capacity;
}