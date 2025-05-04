using Gtk;
using GLib;

class shortcuts {
   public static Button file_manager()
   {
      return(a_shortcuts.apps(Values.FILE_MANAGER, Values.FILE_MANAGER_ICON_NAME));
   }

   public static Button terminal()
   {
      return(a_shortcuts.apps(Values.TERMINAL, Values.TERMINAL_ICON_NAME));
   }

   public static Button browser()
   {
      return(a_shortcuts.apps(Values.BROWSER, Values.BROWSER_ICON_NAME));
   }
}

internal class a_shortcuts {
   public static Button apps(string app_name, string button_icon_name)
   {
      var app_button = new Gtk.Button.from_icon_name(button_icon_name);

      app_button.clicked.connect(() => {
         run_app(app_name);
      });
      return(app_button);
   }

   private static void run_app(string app_name)
   {
      try {
         GLib.Process.spawn_command_line_async(app_name);
      } catch (SpawnError e) {
         var dialog = new Gtk.AlertDialog("kms");
         dialog.show(null);
      }
   }
}
