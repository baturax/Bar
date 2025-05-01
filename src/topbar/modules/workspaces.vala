using Gtk;
using GLib;

class workspaces {

    public static Gtk.Button ws1(Gtk.ApplicationWindow top_window) {
        var ws1 = new Gtk.Button.with_label("1");
        ws1.clicked.connect(() => {
            to_workspace("1", top_window);
            });
        return ws1;
    }
    
    public static Gtk.Button ws2(Gtk.ApplicationWindow top_window) {
        var ws2 = new Gtk.Button.with_label("2");
        ws2.clicked.connect(() => {
            to_workspace("2", top_window);
        });
        return ws2;
    }
    
    public static Gtk.Button ws3(Gtk.ApplicationWindow top_window) {
        var ws3 = new Gtk.Button.with_label("3");
        ws3.clicked.connect(() => {
            to_workspace("3", top_window);
        });
        return ws3;
    }
    
    public static Gtk.Button ws4(Gtk.ApplicationWindow top_window) {
        var ws4 = new Gtk.Button.with_label("4");
        ws4.clicked.connect(() => {
            to_workspace("4", top_window);
        });
        return ws4;
    }
    
    public static Gtk.Button ws5(Gtk.ApplicationWindow top_window) {
        var ws5 = new Gtk.Button.with_label("5");
        ws5.clicked.connect(() => {
            to_workspace("5", top_window);
        });
        return ws5;
    }
    
    public static Gtk.Button ws6(Gtk.ApplicationWindow top_window) {
        var ws6 = new Gtk.Button.with_label("6");
        ws6.clicked.connect(() => {
            to_workspace("6", top_window);
        });
        return ws6;
    }
    
    // public static Gtk.Button ws7(Gtk.ApplicationWindow top_window) {
    //     var ws7 = new Gtk.Button.with_label("7");
    //     ws7.clicked.connect(() => {
    //         to_workspace("7", top_window);
    //     });
    //     return ws7;
    // }
    
    // public static Gtk.Button ws8(Gtk.ApplicationWindow top_window) {
    //     var ws8 = new Gtk.Button.with_label("8");
    //     ws8.clicked.connect(() => {
    //         to_workspace("8", top_window);
    //     });
    //     return ws8;
    // }
    
    // public static Gtk.Button ws9(Gtk.ApplicationWindow top_window) {
    //     var ws9 = new Gtk.Button.with_label("9");
    //     ws9.clicked.connect(() => {
    //         to_workspace("9", top_window);
    //     });
    //     return ws9;
    // }
    
}