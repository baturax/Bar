using Gtk;
using GtkLayerShell;
using GLib;

class MyBar_Top : Gtk.Application {
   public MyBar_Top()
   {
      Object(application_id: Value.Main.APP_ID);
   }

   protected override void activate()
   {
      //  Main App
      var top_window = new Gtk.ApplicationWindow(this)
      {
         title          = "",
         default_height = Value.Main.HEIGHT,
         default_width  = Value.Main.WIDTH,
      };

      //  Shell
      GtkLayerShell.init_for_window(top_window);
      GtkLayerShell.set_layer(top_window, GtkLayerShell.Layer.TOP);
      GtkLayerShell.is_layer_window(top_window);
      GtkLayerShell.set_anchor(top_window, GtkLayerShell.Edge.TOP, true);
      GtkLayerShell.auto_exclusive_zone_enable(top_window);
      GtkLayerShell.set_keyboard_mode(top_window, GtkLayerShell.KeyboardMode.NONE);

      //  Boxs
      var a_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 5);
      var l_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 2);
      var c_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 1);
      var r_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 10);

      //  Extra things
      var shortcuts_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 10);
      var sep0          = new Gtk.Label(Value.Main.SEPERATOR);
      var sep1          = new Gtk.Label(Value.Main.SEPERATOR);

      //  Expanders
      var spacer_left = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
      spacer_left.hexpand = true;
      var spacer_right = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
      spacer_right.hexpand = true;

      // Left Box
      l_box.set_valign(Gtk.Align.CENTER);
      // Workspaces
      l_box.append(workspaces.ws1(top_window));
      l_box.append(workspaces.ws2(top_window));
      l_box.append(workspaces.ws3(top_window));
      l_box.append(workspaces.ws4(top_window));
      l_box.append(workspaces.ws5(top_window));
      l_box.append(workspaces.ws6(top_window));
      //  Opened App
      l_box.append(WhatAppIsOpen.what_app_is_open());
      l_box.append(WhatAppIcon.what_app_icon());

      //  Shortcuts
      shortcuts_box.append(shortcuts.file_manager());
      shortcuts_box.append(shortcuts.terminal());
      shortcuts_box.append(shortcuts.browser());

      //  Center Box
      c_box.set_valign(Gtk.Align.CENTER);
      c_box.append(playing_music());
      c_box.append(shortcuts_box);

      //  Right Box
      r_box.set_valign(Gtk.Align.CENTER);
      //  Volume
      r_box.append(GetVolume.get_volume());
      r_box.append(sep0);
      //  Battery status
      r_box.append(GetBatteryStatus.get_battery_status());
      r_box.append(GetBattery.get_battery());
      r_box.append(sep1);
      //  Clock
      r_box.append(ShowTime.show_time());


      a_box.append(l_box);
      a_box.append(spacer_left);
      a_box.append(c_box);
      a_box.append(spacer_right);
      a_box.append(r_box);

      top_window.child = a_box;
      top_window.present();
   }

   // Methods
   public static int main(string[] args)
   {
      return(new MyBar_Top().run(args));
   }
}
