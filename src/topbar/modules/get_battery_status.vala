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

            string icon = output_.contains("Not Charging") ? "󱟞" :
                          output_.contains("Charging") ? "󰚥 " :
                          output_.contains("Discharging") ? "󰚦 " :
                          output_.contains("Full") ? "󱊦 " : "󰂑 ";

            battery_capacity.set_label(icon + output_);

        } catch (FileError e) {
            battery_capacity.set_label("Forgot to change value?");
        }
        return true;
    });

    return battery_capacity;
}
