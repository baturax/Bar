// ! Topbar

using Gtk;
using GtkLayerShell;
using GLib;

class MyBar_Top : Gtk.Application {
    public MyBar_Top() {
        Object(application_id: Values.APP_ID);
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
        
            //  Boxs
        var top_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 4);
        var center_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 4);
        var right_boxes = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 4);

        var workspaces_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 2);
        var app_and_icon_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 4);
            
            // Workspace Buttons
        var ws1 = workspaces.ws1(top_window);
        var ws2 = workspaces.ws2(top_window);
        var ws3 = workspaces.ws3(top_window);
        var ws4 = workspaces.ws4(top_window);
        var ws5 = workspaces.ws5(top_window);
        var ws6 = workspaces.ws6(top_window);
        workspaces_box.append(ws1);
        workspaces_box.append(ws2);
        workspaces_box.append(ws3);
        workspaces_box.append(ws4);
        workspaces_box.append(ws5);
        workspaces_box.append(ws6);
        
            //  Clock
        var time_label = new Gtk.Label("");
        time_label.set_halign(Gtk.Align.END);
        time_label.set_valign(Gtk.Align.CENTER);
        show_time(time_label);
        right_boxes.append(time_label);
        
            //  Opened App
        var opened_app_label = new Gtk.Label("");
        opened_app_label = what_app_is_open(opened_app_label);
        var app_icon = new Gtk.Image.from_icon_name(null);
        app_icon = what_app_icon(app_icon);
        app_and_icon_box.append(opened_app_label);
        app_and_icon_box.append(app_icon);
        app_and_icon_box.set_halign(Gtk.Align.END);
        app_and_icon_box.set_valign(Gtk.Align.CENTER);
        
        top_box.append(workspaces_box);
        center_box.append(app_and_icon_box);
        center_box.set_hexpand(true);
        center_box.set_halign(Gtk.Align.CENTER);
        top_box.append(center_box);
        
        right_boxes.set_halign(Gtk.Align.END);
        top_box.append(right_boxes);
        
        top_window.child = top_box;
        top_window.present();
    }
    
        // Methods
    public static int main(string[] args) {
        return new MyBar_Top().run(args);
    }

    
    
}
