using Gtk;
using GLib;

class workspaces {

    public static Gtk.Button ws1(Gtk.ApplicationWindow top_window) {
        return ws_buttons(top_window, "1");
    }
    
    public static Gtk.Button ws2(Gtk.ApplicationWindow top_window) {
        return ws_buttons(top_window, "2");
    }
    
    public static Gtk.Button ws3(Gtk.ApplicationWindow top_window) {
        return ws_buttons(top_window, "3");
    }
    
    public static Gtk.Button ws4(Gtk.ApplicationWindow top_window) {
        return ws_buttons(top_window, "4");
    }
    
    public static Gtk.Button ws5(Gtk.ApplicationWindow top_window) {
        return ws_buttons(top_window, "5");
    }
    
    public static Gtk.Button ws6(Gtk.ApplicationWindow top_window) {
        return ws_buttons(top_window, "6");
    }

    private static Gtk.Button ws_buttons(Gtk.Window top_window, string b_name) {
        var ws_button = new Gtk.Button.with_label(b_name);
        ws_button.clicked.connect(() => {
            to_workspace(b_name, top_window);
        });
        return ws_button;
    }
    
}