#!/usr/bin/env -S vala --pkg gtk4 --pkg gtk4-layer-shell-0

using Gtk;
using GtkLayerShell;
using GLib;

class MyBar_Top : Gtk.Application {
    public MyBar_Top() {
        Object(application_id: "test");
    }

    protected override void activate() {
            //  Main App
        var top_window = new Gtk.ApplicationWindow(this) {
            title = "",
            default_height = -1,
            default_width = 1920,
        };
        
            //  Shell
        GtkLayerShell.init_for_window(top_window);
        GtkLayerShell.set_layer(top_window, GtkLayerShell.Layer.TOP);
        GtkLayerShell.is_layer_window(top_window);
        GtkLayerShell.set_anchor(top_window, GtkLayerShell.Edge.TOP, true);
        GtkLayerShell.auto_exclusive_zone_enable(top_window);
        GtkLayerShell.set_keyboard_mode(top_window, GtkLayerShell.KeyboardMode.NONE);
        
        var slider = new Gtk.Scale.with_range (Gtk.Orientation.HORIZONTAL, 0, 130, 1);
        
        var hbox = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 5);
                hbox.homogeneous = true;
                hbox.append (slider);
                hbox.append (get_volume());
        
        
        slider.adjustment.value_changed.connect (() => {
                });
        
        top_window.child = hbox;
        top_window.present();
    }
    
        // Methods
    public static int main(string[] args) {
        return new MyBar_Top().run(args);
    }
    
}

public static Label get_volume() {
    var volume_label = new Gtk.Label("");
    volume_label.set_valign(Gtk.Align.CENTER);
    
    GLib.Timeout.add_seconds(2, () => {
        try {
            string output_;
            var get_c = "sh -c \"wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print \\$2, $3}'\"";
            GLib.Process.spawn_command_line_sync(get_c, out output_);
            output_ = output_.strip();
            var output_as_double = double.parse(output_);
            
            if (output_as_double >= 0.76) {
                volume_label.set_label("󰕾 " + output_);
            } else if (output_as_double >= 0.45 && output_as_double <= 0.75) {
                volume_label.set_label("󰖀 " + output_);
            } else if (output_as_double >= 0.1 && output_as_double <= 0.44) {
                volume_label.set_label("󰕿 " + output_);
            } else if (output_as_double == 0.0 ) {
                volume_label.set_label("󰝟 " + output_);
            }
            
        } catch (SpawnError e){
            volume_label.set_label("Couldnt get sorry");
        }
        return true;
    });
    return volume_label;
}
