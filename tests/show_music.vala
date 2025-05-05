#!/usr/bin/env -S vala --pkg gtk4 --pkg gtk4-layer-shell-0

using Gtk;
using GtkLayerShell;
using GLib;

class ShowMusic: Gtk.Application {
   public ShowMusic() {
      Object(application_id: "bai.ba.bai.");
   }
   protected override void activate() {
      var win = new Gtk.ApplicationWindow(this) {
         title = "",
         default_height = 30,
         default_width = 1920,
      };

      var box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 1);
      box.append(sh_mu());

      win.child = box;
      win.present();


   }
   
   public static int main(string[] args) {
      return new ShowMusic().run(args);
   }
}

public static Label sh_mu() {
   var lab = new Gtk.Label("");
   var command = """playerctl metadata --format "{{ artist }} - {{ title }}"""";

      var left_click = new Gtk.GestureClick();
      var right_click = new Gtk.GestureClick();
      var middle_click = new Gtk.GestureClick();
      var scroll = new Gtk.EventControllerScroll(Gtk.EventControllerScrollFlags.VERTICAL);

      left_click.set_button(Gdk.BUTTON_PRIMARY);
      right_click.set_button(Gdk.BUTTON_SECONDARY);
      middle_click.set_button(Gdk.BUTTON_MIDDLE);


      left_click.pressed.connect((n_press, x, y) => {
         MusicControls.stop_toggle();
      });

      right_click.pressed.connect((n_press, x, y) => {
         //TODO
      });

      middle_click.pressed.connect((n_press, x, y) => {
         //TODO
      });

      scroll.scroll.connect((dx, dy) => {
         if (dy > 0) {
            MusicControls.next_music();
         } else if (dy < 0) {
            MusicControls.previous_music();
         }
         return true;
      });


   lab.add_controller(left_click);
   lab.add_controller(right_click);
   lab.add_controller(middle_click);
   lab.add_controller(scroll);

   try {
      string output;
      GLib.Process.spawn_command_line_sync(command, out output);
      lab.set_label(output);
   } catch (SpawnError e) {
      stdout.printf(e.message);
   }
   return lab;
}

internal class MusicControls {
   public static void stop_toggle() {
      try {
         GLib.Process.spawn_command_line_async("playerctl play-pause");
      } catch(SpawnError e) {

      }
   }

   public static void next_music() {
      try {
         GLib.Process.spawn_command_line_async("playerctl next");
      } catch(SpawnError e) {

      }
   }

   public static void previous_music() {
      try {
         GLib.Process.spawn_command_line_async("playerctl previous");
      } catch(SpawnError e) {

      }
   }

   //public static void right_click () {
      //try {
         //GLib.Process.spawn_command_line_sync("playerctl play-pause");
      //} catch(SpawnError e) {

      //}
   ///}

   //public static void middle_click () {
      //try {
         //GLib.Process.spawn_command_line_sync("playerctl play-pause");
      //} catch(SpawnError e) {

      //}
   ///}


}
