#!/usr/bin/env -S vala --pkg gtk4

void main() {
    var command = "sh -c \"wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print \\$2, $3}'\"";
    string output_;
    
    try {
    
        GLib.Process.spawn_command_line_sync(command, out output_);
        
        output_ = output_.strip();
        var output_as_double = double.parse(output_);
        
        if (output_as_double >= 76) {
        print("󰕾 " + output_);
        } else if (output_as_double >= 0.45 && output_as_double <= 0.75) {
        print("󰖀 " + output_);
        } else if (output_as_double >= 0.1 && output_as_double <= 0.44) {
        print("󰕿 " + output_);
        } else if (output_as_double == 0.0 ) {
        print("󰝟 " + output_);
        }
        
    } catch (SpawnError e) {
    print(e.message);
    }
    
}