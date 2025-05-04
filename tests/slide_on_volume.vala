#!/usr/bin/env -S vala --pkg gtk4 --pkg gtk4-layer-shell-0

using Gtk;
using GtkLayerShell;
using GLib;

public class TestIT: Gtk.Application {
    public TestIT() {
        Object(application_id:"bai.bai.bai.bai.bai");
    }

    protected override void activate() {
        var win = new Gtk.ApplicationWindow(this) {
            title="3131",
            default_height = 30,
            default_width = 1920,
        };
        GtkLayerShell.is_layer_window(win);
        GtkLayerShell.init_for_window(win);
        GtkLayerShell.set_anchor(win, GtkLayerShell.Edge.TOP, true);
        GtkLayerShell.set_layer(win, GtkLayerShell.Layer.TOP);
        GtkLayerShell.auto_exclusive_zone_enable(win);

        var vol_l = new Gtk.Label("updown Label");
        var hbox = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 10);
        hbox.append(vol_l);

        var a = new Gtk.GestureClick();
        a.set_button(0);
        a.pressed.connect((n_press,x,y) => {
           muteIT();
        });

        var b = new Gtk.GestureClick();
        b.set_button(Gdk.BUTTON_SECONDARY);
        b.pressed.connect((n_press,x,y) => {
            app();
        });

        var scr = new Gtk.EventControllerScroll(Gtk.EventControllerScrollFlags.VERTICAL);
        scr.scroll.connect((dx,dy) => {
           if (dy <0) {
               decvol();
           } else if (dy >0) {
               incVol();
           }
           return true;
        });

        vol_l.add_controller(scr);

        vol_l.set_has_tooltip(true);
        vol_l.set_tooltip_text("al");
        vol_l.add_controller(a);
        vol_l.add_controller(b);

        win.child = hbox;
        win.present();
    }

    public static int main(string[] args) {
        return new TestIT().run(args);
    }
}

public static void app() {
   var com = "pavucontrol";
   try {
      string a;
      GLib.Process.spawn_command_line_sync(com, out a);
   } catch (SpawnError e) {
      
   }
}

public static void decvol() {
   var com = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01-";
   try {
      string a;
      GLib.Process.spawn_command_line_sync(com, out a);
   } catch (SpawnError e) {
      
   }
}

public static void incVol() {
   var com = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01+";
   try {
      string a;
      GLib.Process.spawn_command_line_sync(com, out a);
   } catch (SpawnError e) {
      
   }
}

public static void muteIT() {
   var com = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
   try {
      string a;
      GLib.Process.spawn_command_line_sync(com, out a);
   } catch (SpawnError e) {
      
   }
}
