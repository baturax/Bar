using GtkLayerShell;
using Notify;

public class Things {
   public static void Shell(Gtk.ApplicationWindow window) {
      
      GtkLayerShell.init_for_window(window);
      GtkLayerShell.set_layer(window, GtkLayerShell.Layer.TOP);
      GtkLayerShell.set_anchor(window, GtkLayerShell.Edge.TOP, true);
      GtkLayerShell.auto_exclusive_zone_enable(window);
   }

   public static Gtk.Separator seperator() {
      Gtk.Separator sep = new Gtk.Separator(Gtk.Orientation.HORIZONTAL);
      return sep;
   }

   public static Gtk.Label module_seperator() {
      Gtk.Label sep = new Gtk.Label("");
      return sep;
   }

   public static void apply_css(string css_path, Gtk.Widget widget, string css_class) {
      Gdk.Display display = Gdk.Display.get_default();
      Gtk.CssProvider provider = new Gtk.CssProvider();
      uint priority = Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION;
      provider.load_from_path(css_path);
      widget.add_css_class(css_class);
      Gtk.StyleContext.add_provider_for_display(display, provider, priority);
   }

   public static Gtk.AlertDialog warning(string warn_message) {
      Gtk.AlertDialog dialog = new Gtk.AlertDialog(warn_message);
      dialog.show(null);

      return dialog;
   }

   public static Notify.Notification notification(string app_name, string summary, string body, string icon) {
      Notify.init("ba");
      Notify.Notification notification = new Notify.Notification(summary, body, icon);
      try {
         notification.show();
      } catch (Error e) {
         warning(e.message);
      }

      return notification;
   }

}
