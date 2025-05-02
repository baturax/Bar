using Gtk;
using GLib;

public static Label show_time() {
	var clock = new Gtk.Label("");
	clock.set_valign(Gtk.Align.CENTER);
	
	GLib.Timeout.add_seconds(2, () => {
		var c_time = new GLib.DateTime.now_local();
		clock.set_label("🕙 "+c_time.format(Values.CLOCK_FORMAT));
		return true;
	});
	return clock;
}
