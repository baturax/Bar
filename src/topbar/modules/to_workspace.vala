using Gtk;
using GLib;

public static void to_workspace(string ws_number, Gtk.Window? parent) {
    try {
        GLib.Process.spawn_command_line_async(Values.WORKSPACE_CHANGE +ws_number);
        GLib.Process.spawn_command_line_async(Values.WORKSPACE_CHANGE_NOTIFICATION.strip() +ws_number);
    } catch (SpawnError e) {
        var dialog = new Gtk.AlertDialog(Values.NOTIFICATION_ERROR);
        dialog.show(parent);
    }
}
