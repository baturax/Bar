#!/usr/bin/env -S vala --pkg gtk4

void main() {
    var com_file = "/sys/class/power_supply/BAT0/capacity";
    string output_;
    
    try {
    
    FileUtils.get_contents(com_file, out output_);
    output_ = output_.strip();
    var output_as_int = int.parse(output_);
    
    if (output_as_int == 100) {
        stdout.printf("󰁹 " + output_);
    } else if (output_as_int >= 90 && output_as_int <=99) {
        stdout.printf("󰂂 " + output_);
    } else if (output_as_int >= 80 && output_as_int <=89) {
        stdout.printf("󰂁 " + output_);
    } else if (output_as_int >= 70 && output_as_int <=79) {
        stdout.printf("󰂀 " + output_);
    } else if (output_as_int >= 60 && output_as_int <=69) {
        stdout.printf("󰁿 " + output_);
    } else if (output_as_int >= 50 && output_as_int <=59) {
        stdout.printf("󰁾 " + output_);
    } else if (output_as_int >= 40 && output_as_int <=49) {
        stdout.printf("󰁽 " + output_);
    } else if (output_as_int >= 30 && output_as_int <=39) {
        stdout.printf("󰁼 " + output_);
    } else if (output_as_int >= 20 && output_as_int <=29) {
        stdout.printf("󰁻 " + output_);
    } else if (output_as_int >= 10 && output_as_int <=19) {
        stdout.printf("󰁺 " + output_);
    }
    
    } catch (FileError e) {
        print(e.message);
    }
}