using Gtk;
using GLib;

public static Label what_app_is_open(Label app_label) {
    GLib.Timeout.add_seconds(2, () => {
        string stdout;
        var command = "/bin/sh -c 'hyprctl activewindow | grep class: | sed \"s/class: //\"'";
        try {
            GLib.Process.spawn_command_line_sync(command, out stdout, null, null);
            app_label.set_text(" " + stdout.strip());
        } catch (SpawnError e) {
            app_label.set_text("");
        }
        return true;
    });
    return app_label;
}
