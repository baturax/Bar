public static void main() {
    var com = "/bin/sh -c \"niri msg focused-window | awk 'NR==3 {print $3}'\"";
    try {
        string stdoutd;
        GLib.Process.spawn_command_line_sync(com, out stdoutd, null, null);
        stdoutd = stdoutd.strip().replace("\"", "").replace("'", "");
        stdout.printf("%s\n", stdoutd);
    }
    catch (GLib.SpawnError e) {
        stdout.printf("Error: %s\n", e.message);
    }
}
