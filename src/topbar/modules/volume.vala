using Gtk;
using GLib;

public static Label get_volume() {
    var volume_label = new Gtk.Label("");
    volume_label.set_valign(Gtk.Align.CENTER);
    
    GLib.Timeout.add_seconds(2, () => {
        try {
            string output_;
            GLib.Process.spawn_command_line_sync(Values.GET_VOLUME, out output_);
            output_ = output_.strip();
            var output_as_double = double.parse(output_);
            
            if (output_as_double >= 0.76) {
                volume_label.set_label("󰕾 " + output_);
            } else if (output_as_double >= 0.45 && output_as_double <= 0.75) {
                volume_label.set_label("󰖀 " + output_);
            } else if (output_as_double >= 0.1 && output_as_double <= 0.44) {
                volume_label.set_label("󰕿 " + output_);
            } else if (output_as_double == 0.0 ) {
                volume_label.set_label("󰝟 " + output_);
            }
            
        } catch (SpawnError e){
            volume_label.set_label("Couldnt get sorry");
        }
        return true;
    });
    return volume_label;
}
