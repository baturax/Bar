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
            
            // Workspace Button1
        var ws1 = new Gtk.Button.with_label("1");
        ws1.clicked.connect(() => {
            to_workspace("1", top_window);
        });
        
        // Workspace Button2
        var ws2 = new Gtk.Button.with_label("2");
        ws2.clicked.connect(() => {
            to_workspace("2", top_window);
        });
        
        // Workspace Button3
        var ws3 = new Gtk.Button.with_label("3");
        ws3.clicked.connect(() => {
            to_workspace("3", top_window);
        });
        
        // Workspace Button4
        var ws4 = new Gtk.Button.with_label("4");
        ws4.clicked.connect(() => {
            to_workspace("4", top_window);
        });
        
        // Workspace Button5
        var ws5 = new Gtk.Button.with_label("5");
        ws5.clicked.connect(() => {
            to_workspace("5", top_window);
        });
        
        // Workspace Button6
        var ws6 = new Gtk.Button.with_label("6");
        ws6.clicked.connect(() => {
            to_workspace("6", top_window);
        });
        
            //  Shell
        ws_grid.attach(ws1, 0, 0, 1, 1);
        ws_grid.attach_next_to(ws2, ws1, Gtk.PositionType.RIGHT, 1, 1);
        ws_grid.attach_next_to(ws3, ws2, Gtk.PositionType.RIGHT, 1, 1);
        ws_grid.attach_next_to(ws4, ws3, Gtk.PositionType.RIGHT, 1, 1);
        ws_grid.attach_next_to(ws5, ws4, Gtk.PositionType.RIGHT, 1, 1);
        ws_grid.attach_next_to(ws6, ws5, Gtk.PositionType.RIGHT, 1, 1);
        top_window.child = ws_grid;
        top_window.present();
    }
    
    public static int main(string[] args) {
        return new MyBar_Top().run(args);
    }

    public static void to_workspace(string ws_number, Gtk.Window? parent) {
        try {
            GLib.Process.spawn_command_line_async("hyprctl dispatch workspace "+ws_number);
            GLib.Process.spawn_command_line_async("hyprctl notify 5 5000 0 Switched to Workspace "+ws_number);
        } catch (SpawnError e) {
            var dialog = new Gtk.AlertDialog("MAKE SURE YOU'RE USİNG' HYPRLAND");
            dialog.show(parent);
        }
    }
}
