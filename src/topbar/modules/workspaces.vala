using Gtk;
using GLib;

class workspaces {
   public static Gtk.Button ws1(Gtk.ApplicationWindow top_window)
   {
      return(WorkspaceThing.ws_buttons(top_window, Values.WS1_LABEL, Values.WS1));
   }

   public static Gtk.Button ws2(Gtk.ApplicationWindow top_window)
   {
      return(WorkspaceThing.ws_buttons(top_window, Values.WS2_LABEL, Values.WS2));
   }

   public static Gtk.Button ws3(Gtk.ApplicationWindow top_window)
   {
      return(WorkspaceThing.ws_buttons(top_window, Values.WS3_LABEL, Values.WS3));
   }

   public static Gtk.Button ws4(Gtk.ApplicationWindow top_window)
   {
      return(WorkspaceThing.ws_buttons(top_window, Values.WS4_LABEL, Values.WS4));
   }

   public static Gtk.Button ws5(Gtk.ApplicationWindow top_window)
   {
      return(WorkspaceThing.ws_buttons(top_window, Values.WS5_LABEL, Values.WS5));
   }

   public static Gtk.Button ws6(Gtk.ApplicationWindow top_window)
   {
      return(WorkspaceThing.ws_buttons(top_window, Values.WS6_LABEL, Values.WS6));
   }

   

}

internal class WorkspaceThing {
   public static Gtk.Button ws_buttons(Gtk.Window top_window, string button_name, string which_workspace)
   {
      var ws_button = new Gtk.Button.with_label(button_name);

      ws_button.clicked.connect(() => {
         to_workspace(which_workspace, top_window);
      });
      return(ws_button);
   }

      private static void to_workspace(string ws_number, Gtk.Window ?parent)
   {
      try {
         GLib.Process.spawn_command_line_async(Values.WORKSPACE_CHANGE + ws_number);
         GLib.Process.spawn_command_line_async(Values.WORKSPACE_CHANGE_NOTIFICATION.strip() + ws_number);
      } catch (SpawnError e) {
         var dialog = new Gtk.AlertDialog(Values.NOTIFICATION_ERROR);
         dialog.show(parent);
      }
   }
}
