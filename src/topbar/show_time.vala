using Gtk;
using GLib;

public static void show_time(Label clock) {
    var i = new GLib.DateTime.now_local();
    clock.set_label("🕙 "+i.format(Values.CLOCK_FORMAT));
    GLib.Timeout.add_seconds(1, () => {
        var c_time = new GLib.DateTime.now_local();
        clock.set_label("🕙 "+c_time.format(Values.CLOCK_FORMAT));
        return true;
    });
}
