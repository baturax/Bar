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
        
            //  Workspaces grid
        var ws_grid = new Gtk.Grid() {
            column_spacing = 1,
            row_spacing = 6,
        };
        
            //  Boxs
        var app_and_icon_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 4);
        var right_boxes = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 3);
            
            // Workspace Buttons
        var ws1 = workspaces.ws1(top_window);
        var ws2 = workspaces.ws2(top_window);
        var ws3 = workspaces.ws3(top_window);
        var ws4 = workspaces.ws4(top_window);
        var ws5 = workspaces.ws5(top_window);
        var ws6 = workspaces.ws6(top_window);
        
            //  Clock
        var time_label = new Gtk.Label("");
        time_label.set_halign(Gtk.Align.END);
        time_label.set_valign(Gtk.Align.CENTER);
        show_time(time_label);
        
            //  Opened App
        var opened_app = new Gtk.Label("");
        var opened_app_b = what_app_is_open(opened_app);
        var app_icon = new Gtk.Image.from_icon_name(null);
        var app_icon_b = what_app_icon(app_icon);
        app_and_icon_box.append(opened_app_b);
        app_and_icon_box.append(app_icon_b);
        
            //  Shell
        ws_grid.attach(ws1, 0, 0, 1, 1);
        ws_grid.attach_next_to(ws2, ws1, Gtk.PositionType.RIGHT, 1, 1);
        ws_grid.attach_next_to(ws3, ws2, Gtk.PositionType.RIGHT, 1, 1);
        ws_grid.attach_next_to(ws4, ws3, Gtk.PositionType.RIGHT, 1, 1);
        ws_grid.attach_next_to(ws5, ws4, Gtk.PositionType.RIGHT, 1, 1);
        ws_grid.attach_next_to(ws6, ws5, Gtk.PositionType.RIGHT, 1, 1);
        ws_grid.attach_next_to(app_and_icon_box, ws6, Gtk.PositionType.RIGHT, 1, 1);
        ws_grid.attach_next_to(time_label, app_and_icon_box, Gtk.PositionType.RIGHT, 1, 1);
        
        top_window.child = ws_grid;
        top_window.present();
    }
    
        // Methods
    public static int main(string[] args) {
        return new MyBar_Top().run(args);
    }

    
    
}
