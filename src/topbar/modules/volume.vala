using Gtk;
using GLib;

public static Label get_volume() {
    var volume_label = new Gtk.Label("");
    volume_label.set_valign(Gtk.Align.CENTER);
    
    GLib.Timeout.add_seconds(2, () => {
        try {
            string output_;
            GLib.Process.spawn_command_line_sync(Values.GET_VOLUME, out output_);
            volume_label.set_label(output_.strip()+" 󰜟");
        } catch (SpawnError e){
            volume_label.set_label("Couldnt get sorry");
        }
        return true;
    });
    return volume_label;
}
