#!/usr/bin/env -S vala --pkg gtk4

void main() {
    var com_file = "/sys/class/power_supply/BAT0/status";
    string output_;
    
    try {
        FileUtils.get_contents (com_file, out output_);
        output_ = output_.strip();
        
        if (output_.contains("Charging")) {
        stdout.printf("󰚥 " + output_);
        } else if (output_.contains("Disc")) {
        stdout.printf("󰚦 " + output_);
        } else {
        print("󰂑");
        }
        
    } catch(FileError e) {
    print(e.message);
    }
    
}