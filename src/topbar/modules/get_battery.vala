using Gtk;
using GLib;

class GetBattery {
   public static Label get_battery()
   {
      var battery = new Gtk.Label("");

      battery.set_valign(Gtk.Align.CENTER);

      string[] battery_icons =
      {
         "󰁺 ", "󰁻 ", "󰁼 ", "󰁽 ", "󰁾 ",
         "󰁿 ", "󰂀 ", "󰂁 ", "󰂂 ", "󰁹 "
      };

      Timeout.add_seconds(2, () => {
         string output;

         try {
            if (FileUtils.get_contents(Values.BATTERY_CAPACITY_FILE, out output))
            {
               output        = output.strip();
               uint capacity = uint.parse(output);
               uint index    = (capacity * (battery_icons.length - 1)) / 100;
               battery.set_label(battery_icons[index] + output);
            }
            else
            {
               battery.set_label("Couldn't find battery, maybe change values?");
            }
         } catch (FileError e) {
            battery.set_label("Couldn't find battery, maybe change values?");
         }

         return(true);
      });

      return(battery);
   }
}
