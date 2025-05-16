class Controls {

   public static Gtk.EventControllerScroll allScrolls(Gtk.Label label, string scroll_up, string scroll_down) {
      
      Gtk.EventControllerScroll scroll = new Gtk.EventControllerScroll(Gtk.EventControllerScrollFlags.VERTICAL);

      scroll.scroll.connect((dx, dy) => {
         if (dy < 0) {
            try {
               GLib.Process.spawn_command_line_async(scroll_up);
            } catch (GLib.SpawnError e) {
               Things.warning(e.message);
            }
         } else if (dy > 0) {
            try {
               GLib.Process.spawn_command_line_async(scroll_down);
            } catch(GLib.SpawnError e) {
               Things.warning(e.message);
            }
         }
         return true;
      });
      
      label.add_controller(scroll);
      return scroll;

   }

   
   public static Gtk.GestureClick allGestures(uint which_button, string command, Gtk.Label label) {
      
      Gtk.GestureClick gesture = new Gtk.GestureClick();

      gesture.set_button(which_button);

      gesture.pressed.connect(() => {
         
         try {
            GLib.Process.spawn_command_line_async(command);
         } catch (GLib.SpawnError e) {
            Things.warning(e.message);
         }

      });

      label.add_controller(gesture);

      
      return gesture;
   }

}

