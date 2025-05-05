using Gtk;
using GtkLayerShell;
using GLib;

public static Label playing_music() {
   var music_label = new Gtk.Label("");
   music_label.set_valign(Gtk.Align.CENTER);

   GLib.Timeout.add_seconds(2, () => {
      try {
         string output;
         GLib.Process.spawn_command_line_sync(Values.MUSIC_COMMAND, out output);
         output = output.strip();
         music_label.set_label(output);
      } catch (SpawnError e) {
         stdout.printf(e.message);
      }
      return true;
      });
      return music_label;
}
