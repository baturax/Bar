using Gtk;

public class Bar: Gtk.Application {
   public Bar() {
      Object(application_id: "bai.top.bar");
   }

   public override void activate() {
      Gtk.ApplicationWindow window = new Gtk.ApplicationWindow(this);
      window.default_width = Values.Main.WIDTH;
      window.default_height = Values.Main.HEIGHT;

      Things.Shell(window);

         // Spacers
      Gtk.Box spacer_one = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
      Gtk.Box spacer_two = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
      spacer_one.set_hexpand(true);
      spacer_two.set_hexpand(true);
      
         // Boxes
      Gtk.Box all_ws = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 1);
      Gtk.Box left_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 5);
      Gtk.Box center_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 3);
      Gtk.Box right_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 4);

         // Left Box
      left_box.append(Workspace.all_workspaces());
      left_box.append(Things.seperator());
      left_box.append(OpenedApp.opened_app());
      left_box.append(AppImage.opened_app_icon());

         // Center Box
      center_box.append(Music.show_music());
      center_box.append(Shortcuts.terminal());
      center_box.append(Shortcuts.file_manager());
      center_box.append(Shortcuts.browser());

         // Right Box
      right_box.append(Volume.show_wolume());
      right_box.append(Things.module_seperator());
      right_box.append(Status.show_status());
      right_box.append(Battery.show_battery());
      right_box.append(Things.module_seperator());
      right_box.append(Time.show_time());

      all_ws.append(left_box);
      all_ws.append(spacer_one);
      all_ws.append(center_box);
      all_ws.append(spacer_two);
      all_ws.append(right_box);

      window.set_child(all_ws);
      window.present();
   }

   public static int main(string[] args) {
      return (new Bar().run(args));
   }

}
