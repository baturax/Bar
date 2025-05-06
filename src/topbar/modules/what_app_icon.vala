using Gtk;
using GLib;

class WhatAppIcon {
   public static Image what_app_icon()
   {
      var app_icon = new Gtk.Image.from_icon_name("");

      app_icon.set_valign(Gtk.Align.CENTER);
      GLib.Timeout.add_seconds(2, () => {
         string output_;
         try {
            GLib.Process.spawn_command_line_sync(Value.WhatAppIsOpen.GET_OPEN_APP, out output_, null, null);
            output_ = output_.strip().replace("\"", "").replace("'", "");
            app_icon.set_from_icon_name(output_.strip());
         } catch (SpawnError e) {
            app_icon.set_from_icon_name(null);
         }

         return(true);
      });
      return(app_icon);
   }
}
