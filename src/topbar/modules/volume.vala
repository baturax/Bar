using Gtk;
using GLib;


class GetVolume {
   public static Label get_volume()
   {
      var volume_label = new Gtk.Label("");

      volume_label.set_valign(Gtk.Align.CENTER);

      var left_click = new Gtk.GestureClick();
      var right_click = new Gtk.GestureClick();
      var middle_click = new Gtk.GestureClick();

      left_click.set_button(Gdk.BUTTON_PRIMARY);
      right_click.set_button(Gdk.BUTTON_SECONDARY);
      middle_click.set_button(Gdk.BUTTON_MIDDLE);

      left_click.pressed.connect((n_press, x, y) => {
         VolumeControls.toggle_mute_volume();
      });

      right_click.pressed.connect((n_press, x, y) => {
         VolumeControls.volume_app();
      });

      middle_click.pressed.connect((n_press, x, y) => {
         //TODO
      });

      volume_label.add_controller(left_click);
      volume_label.add_controller(right_click);
      volume_label.add_controller(middle_click);

      GLib.Timeout.add_seconds(2, () => {
         try {
            string output_;
            GLib.Process.spawn_command_line_sync(Values.GET_VOLUME, out output_);
            output_ = output_.strip();
            var output_as_double = double.parse(output_);


            if (output_as_double >= 0.76)
            {
               volume_label.set_label("󰕾 " + output_);
            }
            else if (output_as_double >= 0.45 && output_as_double <= 0.75)
            {
               volume_label.set_label("󰖀 " + output_);
            }
            else if (output_as_double >= 0.1 && output_as_double <= 0.44)
            {
               volume_label.set_label("󰕿 " + output_);
            }
            else if (output_as_double == 0.0)
            {
               volume_label.set_label("󰝟 " + output_);
            }
         } catch (SpawnError e) {
            volume_label.set_label("Couldnt get sorry");
         }
         return(true);
      });
      return(volume_label);
   }
}

internal class VolumeControls {
   public static void volume_app()
   {
      try {
         GLib.Process.spawn_command_line_sync(Values.VOLUME_APP);
      } catch (SpawnError e) {
      }
   }

   public static void increase_volume()
   {
      try {
         GLib.Process.spawn_command_line_sync(Values.INCREASE_VOLUME);
      } catch (SpawnError e) {
      }
   }

   public static void decrease_volume()
   {
      try {
         GLib.Process.spawn_command_line_sync(Values.DECREASE_VOLUME);
      } catch (SpawnError e) {
      }
   }

   public static void toggle_mute_volume()
   {
      try {
         GLib.Process.spawn_command_line_sync(Values.TOGGLE_MUTE_VOLUME);
      } catch (SpawnError e) {
      }
   }
}
