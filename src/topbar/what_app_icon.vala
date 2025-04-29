using Gtk;
using GLib;

public static Image what_app_icon(Image app_icon) {
    GLib.Timeout.add_seconds(2, () => {
        string stdout;
        try {
            bool success = GLib.Process.spawn_command_line_sync(Values.GET_OPEN_APP, out stdout, null, null);

            if (success) {
                app_icon.set_from_icon_name(stdout.strip());
            } else {
                app_icon.set_from_icon_name(null);
            }
        } catch (GLib.SpawnError e) {
            app_icon.set_from_icon_name(null);
        }

        return true;
    });
    return app_icon;
}
