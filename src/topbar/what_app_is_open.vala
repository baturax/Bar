using Gtk;
using GLib;

public static Label what_app_is_open() {
    var app_label = new Gtk.Label("");
    GLib.Timeout.add_seconds(2, () => {
        string stdout;
        try {
            GLib.Process.spawn_command_line_sync(Values.GET_OPEN_APP, out stdout, null, null);
            app_label.set_text(" " + stdout.strip());
        } catch (SpawnError e) {
            app_label.set_text("");
        }
        return true;
    });
    return app_label;
}
