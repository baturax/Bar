using Gtk;

public class Workspace{

   public static Gtk.Box all_workspaces() {
      
      Gtk.Box all_wss = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 2);
      all_wss.append(button_one());
      all_wss.append(button_two());
      all_wss.append(button_three());
      all_wss.append(button_four());
      all_wss.append(button_five());
      all_wss.append(button_six());

      return all_wss;
   }

   private static Gtk.Button button_one() {
      return ws_things.ws_change(Values.Workspaces.WS_ONE, Values.Workspaces.WS_BUTTON_ONE);
   }

   private static Gtk.Button button_two() {
      return ws_things.ws_change(Values.Workspaces.WS_TWO, Values.Workspaces.WS_BUTTON_TWO);
   }

   private static Gtk.Button button_three() {
      return ws_things.ws_change(Values.Workspaces.WS_THREE, Values.Workspaces.WS_BUTTON_THREE);
   }

   private static Gtk.Button button_four() {
      return ws_things.ws_change(Values.Workspaces.WS_FOUR, Values.Workspaces.WS_BUTTON_FOUR);
   }

   private static Gtk.Button button_five() {
      return ws_things.ws_change(Values.Workspaces.WS_FIVE, Values.Workspaces.WS_BUTTON_FIVE);
   }

   private static Gtk.Button button_six() {
      return ws_things.ws_change(Values.Workspaces.WS_SIX, Values.Workspaces.WS_BUTTON_SIX);
   }
}

internal class ws_things {
   public static Gtk.Button ws_change(GLib.Value which_workspace, GLib.Value button_name) {

      Gtk.Button ws_button = new Gtk.Button();
      ws_button.set_label(button_name.get_string());

      ws_button.clicked.connect(() => {
         to_ws(which_workspace.get_string());
      });

      return ws_button;
   }

   private static void to_ws(string which_workspace) {
      string _output;
      try {
         GLib.Process.spawn_command_line_sync(Values.Workspaces.WS_COMMAND + which_workspace, out _output);
         
         Things.notification("Bar", "Workspace changed", "Workspace changed to: " + which_workspace, "mail-forward");

      } catch (SpawnError e) {
         Things.warning("couldn't change workspace, error: " + e.message);
      }
   }
}
