using Gtk;
using GLib;

public static Image what_app_icon() {
    var app_icon = new Gtk.Image.from_icon_name("");
    app_icon.set_valign(Gtk.Align.CENTER);
    GLib.Timeout.add_seconds(2, () => {
        string stdout;
        try {
            GLib.Process.spawn_command_line_sync(Values.GET_OPEN_APP, out stdout, null, null);
            stdout = stdout.strip().replace("\"", "").replace("'", "");
            app_icon.set_from_icon_name(stdout.strip());
            
        } catch (SpawnError e) {
            app_icon.set_from_icon_name(null);
        }

        return true;
    });
    return app_icon;
}
