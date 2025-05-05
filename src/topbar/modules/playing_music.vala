using Gtk;
using GtkLayerShell;
using GLib;

public static Label playing_music()
{
   var music_label = new Gtk.Label("");

   music_label.set_valign(Gtk.Align.CENTER);

   var left_click   = new Gtk.GestureClick();
   var right_click  = new Gtk.GestureClick();
   var middle_click = new Gtk.GestureClick();
   var scroll       = new Gtk.EventControllerScroll(Gtk.EventControllerScrollFlags.VERTICAL);

   left_click.set_button(Gdk.BUTTON_PRIMARY);
   right_click.set_button(Gdk.BUTTON_SECONDARY);
   middle_click.set_button(Gdk.BUTTON_MIDDLE);

   left_click.pressed.connect(() => {
      MusicControls.stop_toggle();
   });

   right_click.pressed.connect(() => {
   });

   middle_click.pressed.connect(() => {
   });

   scroll.scroll.connect((dx, dy) => {
      if (dy < 0)
      {
         MusicControls.next_music();
      }
      else if (dy > 0)
      {
         MusicControls.previous_music();
      }
      return(true);
   });

   music_label.add_controller(left_click);
   music_label.add_controller(right_click);
   music_label.add_controller(middle_click);
   music_label.add_controller(scroll);

   GLib.Timeout.add_seconds(2, () => {
      try {
         string output;
         GLib.Process.spawn_command_line_sync(Values.MUSIC_COMMAND, out output);
         output = output.strip();
         music_label.set_label(output);
      } catch (SpawnError e) {
         stdout.printf(e.message);
      }
      return(true);
   });
   return(music_label);
}

internal class MusicControls {
   public static void stop_toggle()
   {
      try {
         GLib.Process.spawn_command_line_async(Values.TOGGLE_MUSIC);
      } catch (SpawnError e) {
      }
   }

   public static void next_music()
   {
      try {
         GLib.Process.spawn_command_line_async(Values.NEXT_MUSIC);
      } catch (SpawnError e) {
      }
   }

   public static void previous_music()
   {
      try {
         GLib.Process.spawn_command_line_async(Values.PREV_MUSIC);
      } catch (SpawnError e) {
      }
   }

   //public static void right_click () {
   //try {
   //GLib.Process.spawn_command_line_sync("");
   //} catch(SpawnError e) {

   //}
   ///}

   //public static void middle_click () {
   //try {
   //GLib.Process.spawn_command_line_sync("");
   //} catch(SpawnError e) {

   //}
   ///}
}
