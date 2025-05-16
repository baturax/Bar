class AppImage {

   public static Gtk.Image opened_app_icon() {
      var image = new Gtk.Image();

      getImage(image);

      GLib.Timeout.add_seconds(3, () => {
         getImage(image);
         return true;
      });

      return image;
   }

   private static Gtk.Image getImage(Gtk.Image app_icon) {
      string _output;

      Json.Parser parser = new Json.Parser();

      try {
         GLib.Process.spawn_command_line_sync(Values.Window.APP_COMMAND, out _output);
      } catch (GLib.SpawnError e) {
         Things.warning(e.message);
      }

      try {
         parser.load_from_data(_output, -1);
      } catch (GLib.Error e) {
         Things.warning(e.message);
      }

      var root_obj = parser.get_root().get_object();
      var app_id = root_obj.get_string_member("app_id");

      app_icon.set_from_icon_name(app_id);

      return app_icon;
   }
}
