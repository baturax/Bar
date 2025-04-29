using Gtk;
using GLib;

public static Label what_app_is_open(Label app_label) {
    GLib.Timeout.add_seconds(2, () => {
        string stdout;
        var command = "/bin/sh -c 'hyprctl activewindow | grep class: | sed \"s/class: //\"'";
        try {
            GLib.Process.spawn_command_line_sync(command, out stdout, null, null);
            app_label.set_text(" " + stdout.strip());
        } catch (SpawnError e) {
            app_label.set_text("");
        }
        return true;
    });
    return app_label;
}

public static Image what_app_icon(Image app_icon) {
    GLib.Timeout.add_seconds(2, () => {
        string stdout;
        var command = "/bin/sh -c \"hyprctl activewindow | grep class: | sed 's/class: //'\"";
        try {
            // Komutun çıktısını alıyoruz
            bool success = GLib.Process.spawn_command_line_sync(command, out stdout, null, null);

            // Eğer komut başarıyla çalıştıysa, stdout değerini işliyoruz
            if (success) {
                app_icon.set_from_icon_name(stdout.strip()); // stdout'u boşluklardan arındırıyoruz
            } else {
                app_icon.set_from_icon_name(null);
            }
        } catch (GLib.SpawnError e) {
            // Hata durumunda icon'u sıfırlıyoruz
            app_icon.set_from_icon_name(null);
        }

        return true;
    });
    return app_icon;
}
