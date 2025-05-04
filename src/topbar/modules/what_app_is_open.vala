using Gtk;
using GLib;

class WhatAppIsOpen {
   public static Label what_app_is_open()
   {
      var app_label = new Gtk.Label("");

      app_label.set_valign(Gtk.Align.CENTER);
      GLib.Timeout.add_seconds(2, () => {
         string output_;
         try {
            GLib.Process.spawn_command_line_sync(Values.GET_OPEN_APP, out output_, null, null);
            output_ = output_.strip().replace("\"", "").replace("'", "");
            app_label.set_text(" " + output_.strip());
         } catch (SpawnError e) {
            app_label.set_text("");
         }
         return(true);
      });
      return(app_label);
   }
}
