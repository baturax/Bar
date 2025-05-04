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
           print("nigga");
        });

        vol_l.set_has_tooltip(true);
        vol_l.set_tooltip_text("al");

        win.child = hbox;
        win.present();
    }

    public static int main(string[] args) {
        return new TestIT().run(args);
    }
}
