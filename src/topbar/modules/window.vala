using Gtk;
using Json;

class OpenedApp {

   public static Gtk.Label opened_app() {
      Gtk.Label opened_app = new Gtk.Label("");

      getApp(opened_app);

      GLib.Timeout.add_seconds(3, () => {
         getApp(opened_app);
         return true;
      });

      return opened_app;
   }

   private static Gtk.Label getApp(Gtk.Label app_label) {
      
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

         // APP_ID
      var app_id = root_obj.get_string_member("app_id");
      app_label.set_label(app_id);

         // Title
      var app_title = root_obj.get_string_member("title");
      app_label.set_tooltip_text(app_title);

      return app_label;
   }
}
