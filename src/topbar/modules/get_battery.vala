using Gtk;
using GLib;

public static Label get_battery() {
    var battery = new Gtk.Label("");
    battery.set_valign(Gtk.Align.CENTER);
    string[] battery_icon = {
        "󰁺 ", "󰁻 ", "󰁼 ", "󰁽 ", "󰁾 ",
        "󰁿 ", "󰂀 ", "󰂁 ", "󰂂 ", "󰁹 "
    };
    
    GLib.Timeout.add_seconds(2, () => {
        string output_;
        try {
        if (FileUtils.get_contents(Values.BATTERY_CAPACITY_FILE, out output_)) {
            output_ = output_.strip();
            uint output_as_int = uint.parse(output_);
            uint index = (output_as_int * (battery_icon.length - 1)) / 100;
            battery.set_label(battery_icon[index]+output_);
        
        }
        else{
            battery.set_label("couldnt find battery, maybe change values?");
        }
            
            
            
        } catch (FileError e) {
            battery.set_label("couldnt find battery, maybe change values?");
        }
        return true;
    });
    return battery;
}
