// ! Topbar

using Gtk;
using GtkLayerShell;
using GLib;

class MyBar_Top : Gtk.Application {
    public MyBar_Top() {
        Object(application_id: "bai.bai.Bar.Top");
    }

    protected override void activate() {

            //  Main App
        var top_window = new Gtk.ApplicationWindow(this) {
            title = "31",
            default_height = -1,
            default_width = 1920,
        };
        
            //  Shell
        GtkLayerShell.init_for_window(top_window);
        GtkLayerShell.set_layer(top_window, GtkLayerShell.Layer.TOP);
        GtkLayerShell.is_layer_window(top_window);
        GtkLayerShell.set_anchor(top_window, GtkLayerShell.Edge.TOP, true);
        GtkLayerShell.auto_exclusive_zone_enable(top_window);
        GtkLayerShell.set_keyboard_mode(top_window, GtkLayerShell.KeyboardMode.ON_DEMAND);
        
            //  workspaces grid
        var ws_grid = new Gtk.Grid() {
            column_spacing = 1,
            row_spacing = 6,
        };
            
            //  Button1
        var ws1 = new Gtk.Button.with_label("1");
        ws1.clicked.connect(() => {
            to_workspace("1");
        });
        
            //  Shell
        ws_grid.attach(ws1, 0, 0, 1, 1);
        top_window.child = ws_grid;
        top_window.present();
    }
    
    public static int main(string[] args) {
        return new MyBar_Top().run(args);
    }

    public static void to_workspace(string ws_number) {
        try {
            GLib.Process.spawn_command_line_async("hyprctl dispatch workspace "+ws_number);
            GLib.Process.spawn_command_line_async("hyprctl notify 5 5000 0 Switched to Workspace "+ws_number);
        } catch (SpawnError e) {

        }
    }
}

