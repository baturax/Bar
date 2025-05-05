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
   try {
      string output;
      GLib.Process.spawn_command_line_sync(command, out output);
      lab.set_label(output);
   } catch (SpawnError e) {
      stdout.printf(e.message);
   }
   return lab;
}
