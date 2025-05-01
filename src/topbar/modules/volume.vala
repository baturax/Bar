using Gtk;
using GLib;

public static Label get_volume() {
    var volume_label = new Gtk.Label("");
    volume_label.set_valign(Gtk.Align.CENTER);
    
    GLib.Timeout.add_seconds(2, () => {
        try {
            string stdout;
            GLib.Process.spawn_command_line_sync(Values.GET_VOLUME, out stdout);
            volume_label.set_label(stdout.strip()+" 󰜟");
        } catch (SpawnError e){
            volume_label.set_label("Couldnt get sorry");
        }
        return true;
    });
    return volume_label;
}
