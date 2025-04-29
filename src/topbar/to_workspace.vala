using Gtk;
using GLib;

public static void to_workspace(string ws_number, Gtk.Window? parent) {
    try {
        GLib.Process.spawn_command_line_async("hyprctl dispatch workspace "+ws_number);
        GLib.Process.spawn_command_line_async("hyprctl notify 5 5000 0 Switched to Workspace "+ws_number);
    } catch (SpawnError e) {
        var dialog = new Gtk.AlertDialog("MAKE SURE YOU'RE USİNG' HYPRLAND");
        dialog.show(parent);
    }
}