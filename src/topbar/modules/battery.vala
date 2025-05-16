using Gtk;

class Battery {

   public static Gtk.Label show_battery() {
      Gtk.Label label = new Gtk.Label("");

      getBattery(label);

      GLib.Timeout.add(60, () => {
         getBattery(label);
         return true;
      });

      return label;
   }


   private static Gtk.Label getBattery(Gtk.Label label) {
      
      string[] battery_icons = {
         "󱟨 ", "󰁺 ", "󰁻 ", "󰁼 ", "󰁽 ", "󰁾 ",
         "󰁿 ", "󰂀 ", "󰂁 ", "󰂂 ", "󰁹 ", "󱊣 "
      };
      string _output;

      try {
         FileUtils.get_contents(Values.Battery.BATTERY_FILE, out _output);
         _output = _output.strip();
         int _output_int = int.parse(_output);

         string bat = _output_int == 100                     ? battery_icons[11]:
                      _output_int >= 90 && _output_int <= 99 ? battery_icons[10]:
                      _output_int >= 80 && _output_int <= 89 ? battery_icons[9]:
                      _output_int >= 70 && _output_int <= 79 ? battery_icons[8]:
                      _output_int >= 60 && _output_int <= 69 ? battery_icons[7]:
                      _output_int >= 50 && _output_int <= 59 ? battery_icons[6]:
                      _output_int >= 40 && _output_int <= 49 ? battery_icons[5]:
                      _output_int >= 30 && _output_int <= 39 ? battery_icons[4]:
                      _output_int >= 20 && _output_int <= 29 ? battery_icons[3]:
                      _output_int >= 10 && _output_int <= 19 ? battery_icons[2]:
                      _output_int >= 0  && _output_int <= 9  ? battery_icons[1]: battery_icons[0];

         label.set_label(bat+_output);

      } catch (GLib.FileError e) {
         Things.warning(e.message);
      }

      return label;
   }
}
