using Gtk;

class Volume {

   public static Gtk.Label show_wolume() {
      
      Gtk.Label label = new Gtk.Label("");

      getVolume(label);

      GLib.Timeout.add(200, () => {
         getVolume(label);
         return true;
      });
      Controls.allGestures(1, Values.Volume.TOGGLE_MUTE_VOLUME, label);
      Controls.allGestures(3, Values.Volume.VOLUME_APP, label);
      Controls.allScrolls(label, Values.Volume.INCREASE_VOLUME, Values.Volume.DECREASE_VOLUME);

      return label;

   }

   private static Gtk.Label getVolume(Gtk.Label label) {
      
      string[] volume_icons = {
      "󰖁 ", "󰕿 ", "󰖀 ", "󰕾 "
      };
      string _output;
      
      try {
         GLib.Process.spawn_command_line_sync(Values.Volume.GET_VOLUME, out _output);
         _output = _output.strip();
         double _output_double = double.parse(_output);

         string icons =    _output.contains("MUTED")                        ? volume_icons[0]:
                           _output_double == 0.0                            ? volume_icons[0]:
                           _output_double >= 0.71                           ? volume_icons[3]:
                           _output_double >= 0.36 || _output_double <= 0.70 ? volume_icons[2]:
                           _output_double >= 0.1  || _output_double <= 0.35 ? volume_icons[1]: "Error";



         label.set_label(icons+_output);
      } catch (GLib.SpawnError e) {
         Things.warning(e.message);
      }

      return label;
   }
}
