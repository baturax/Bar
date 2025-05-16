using Gtk;

class Shortcuts {
   public static Gtk.Button file_manager()
   {
      return allShortcuts(Values.Shortcuts.FILE_MANAGER, Values.Shortcuts.FILE_MANAGER_ICON_NAME);
   }

   public static Button terminal()
   {
      return allShortcuts(Values.Shortcuts.TERMINAL, Values.Shortcuts.TERMINAL_ICON_NAME);
   }

   public static Button browser()
   {
      return allShortcuts(Values.Shortcuts.BROWSER, Values.Shortcuts.BROWSER_ICON_NAME);
   }

   private static Gtk.Button allShortcuts(string app_command, string button_name) {
      
      Gtk.Button app_button = new Gtk.Button.from_icon_name(button_name);

      app_button.clicked.connect(() => {
         try {
            GLib.Process.spawn_command_line_async(app_command);
         } catch (GLib.SpawnError e) {
            Things.warning(e.message);
         }
      });
      
      return app_button;
   }
}
