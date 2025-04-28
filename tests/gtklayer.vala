#!/usr/bin/env -S vala --pkg gtk4 --pkg gtk4-layer-shell-0

using Gtk;
using GtkLayerShell;

void main() {
   stdout.printf(GtkLayerShell.get_minor_version().to_string());
}