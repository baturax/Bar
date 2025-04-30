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
        
            //  Boxs
        var a_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 5);
        var l_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 2);
        var c_box =  new Gtk.Box(Gtk.Orientation.HORIZONTAL, 1);
        var r_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 1);
            
            // Left Box
        l_box.set_valign(Gtk.Align.CENTER);
            // Workspaces
        l_box.append(workspaces.ws1(top_window));
        l_box.append(workspaces.ws2(top_window));
        l_box.append(workspaces.ws3(top_window));
        l_box.append(workspaces.ws4(top_window));
        l_box.append(workspaces.ws5(top_window));
        l_box.append(workspaces.ws6(top_window));
            //  Opened App
        l_box.append(what_app_is_open());
        l_box.append(what_app_icon());
        
        a_box.append(l_box);
        
            //  Clock
        var time_label = new Gtk.Label("");
        show_time(time_label);
        
            //  Battery Capacity
        var battery_label = new Gtk.Label("");
        battery_label = get_battery_capacity(battery_label);
        
        top_window.child = a_box;
        top_window.present();
    }
    
        // Methods
    public static int main(string[] args) {
        return new MyBar_Top().run(args);
    }

    
    
}
