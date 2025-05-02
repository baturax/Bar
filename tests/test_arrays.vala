#!/usr/bin/env -S vala --pkg gee-1.0

void main() {
    int battery = 100;
    string[] battery_icon = {
        "󰁺 ", "󰁻 ", "󰁼 ", "󰁽 ", "󰁾 ",
        "󰁿 ", "󰂀 ", "󰂁 ", "󰂂 ", "󰁹 "
    };

    int index = (battery * (battery_icon.length - 1)) / 100;

    stdout.printf("%s %d%%", battery_icon[index], battery);
}
