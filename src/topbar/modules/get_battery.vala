using Gtk;
using GLib;

public static Label get_battery() {
    var battery = new Gtk.Label("");
    battery.set_valign(Gtk.Align.CENTER);
    GLib.Timeout.add_seconds(2, () => {
        string output_;
        try {
            FileUtils.get_contents(Values.BATTERY_CAPACITY_FILE, out output_);
            output_ = output_.strip();
            var output_as_int = int.parse(output_);
            
            if (output_as_int == 100) {
                battery.set_label("󰁹 " + output_);
            } else if (output_as_int >= 90 && output_as_int <=99) {
                battery.set_label("󰂂 " + output_);
            } else if (output_as_int >= 80 && output_as_int <=89) {
                battery.set_label("󰂁 " + output_);
            } else if (output_as_int >= 70 && output_as_int <=79) {
                battery.set_label("󰂀 " + output_);
            } else if (output_as_int >= 60 && output_as_int <=69) {
                battery.set_label("󰁿 " + output_);
            } else if (output_as_int >= 50 && output_as_int <=59) {
                battery.set_label("󰁾 " + output_);
            } else if (output_as_int >= 40 && output_as_int <=49) {
                battery.set_label("󰁽 " + output_);
            } else if (output_as_int >= 30 && output_as_int <=39) {
                battery.set_label("󰁼 " + output_);
            } else if (output_as_int >= 20 && output_as_int <=29) {
                battery.set_label("󰁻 " + output_);
            } else if (output_as_int >= 10 && output_as_int <=19) {
                battery.set_label("󰁺 " + output_);
            } else if (output_as_int <= 9) {
                battery.set_label("󱊡 LOW BATTERY WARNING PLUG TO CHARGE" + output_);
            } else {
                battery.set_label("󱉝");
            }
            
        } catch (FileError e) {
            battery.set_label("couldnt find battery, maybe change values?");
        }
        return true;
    });
    return battery;
}