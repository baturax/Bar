using Gtk;
using GLib;

class workspaces {
   public static Gtk.Button ws1(Gtk.ApplicationWindow top_window)
   {
      return(ws_buttons(top_window, Values.WS1_LABEL));
   }

   public static Gtk.Button ws2(Gtk.ApplicationWindow top_window)
   {
      return(ws_buttons(top_window, Values.WS2_LABEL));
   }

   public static Gtk.Button ws3(Gtk.ApplicationWindow top_window)
   {
      return(ws_buttons(top_window, Values.WS3_LABEL));
   }

   public static Gtk.Button ws4(Gtk.ApplicationWindow top_window)
   {
      return(ws_buttons(top_window, Values.WS4_LABEL));
   }

   public static Gtk.Button ws5(Gtk.ApplicationWindow top_window)
   {
      return(ws_buttons(top_window, Values.WS5_LABEL));
   }

   public static Gtk.Button ws6(Gtk.ApplicationWindow top_window)
   {
      return(ws_buttons(top_window, Values.WS6_LABEL));
   }

   private static Gtk.Button ws_buttons(Gtk.Window top_window, string b_name)
   {
      var ws_button = new Gtk.Button.with_label(b_name);

      ws_button.clicked.connect(() => {
         ToWorkspace.to_workspace(b_name, top_window);
      });
      return(ws_button);
   }
}
