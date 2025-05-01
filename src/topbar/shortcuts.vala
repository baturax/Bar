using Gtk;
using GLib;

class shortcuts{

    public static Button file_manager() {
        var f_m_b = new Gtk.Button.from_icon_name("system-file-manager");
        f_m_b.clicked.connect(() => {
            run_app(Values.FILE_MANAGER);
        });
        return f_m_b;
    }
    
    public static Button terminal() {
        var f_m_b = new Gtk.Button.from_icon_name("utilities-terminal");
        f_m_b.clicked.connect(() => {
            run_app(Values.TERMINAL);
        });
        return f_m_b;
    }
    
    public static Button browser() {
        var f_m_b = new Gtk.Button.from_icon_name("applications-internet");
        f_m_b.clicked.connect(() => {
            run_app(Values.BROWSER);
        });
        return f_m_b;
    }

}

public static void run_app(string app_name) {
    try {
        GLib.Process.spawn_command_line_async(app_name);
    } catch (SpawnError e) {
        var dialog = new Gtk.AlertDialog("kms");
        dialog.show(null);
    }
}
