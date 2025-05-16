using Gtk;

class Music {

   public static Gtk.Label show_music() {
      
      Gtk.Label label = new Gtk.Label("");

      getMusic(label);

      GLib.Timeout.add_seconds(5, () => {
         getMusic(label);
         return true;
      });

      Controls.allGestures(1, Values.Music.TOGGLE_MUSIC, label);
      Controls.allScrolls(label, Values.Music.NEXT_MUSIC, Values.Music.PREV_MUSIC);

      return label;

   }

   private static Gtk.Label getMusic(Gtk.Label label) {
      
      string _output;

      try {
         GLib.Process.spawn_command_line_sync(Values.Music.MUSIC_COMMAND, out _output);
         _output = _output.strip();
         label.set_label(_output);
      } catch (GLib.SpawnError e) {
         Things.warning(e.message);
      }

      return label;
   }

}
