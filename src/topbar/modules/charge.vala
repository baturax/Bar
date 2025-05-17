using Gtk;

class Status {

   public static Gtk.Label show_status() {
      
      Gtk.Label label = new Gtk.Label("");
      getStatus(label);

      GLib.Timeout.add_seconds(60, () => {
         getStatus(label);
         return true;
      });

      return label;

   }
   
   private static Gtk.Label getStatus(Gtk.Label label) {

      string[] charge_icons = {
         "󱟞 ", "󰚥 ",
         "󰚦 ", "󱊦 "
      };
      string _output;

      try {
         FileUtils.get_contents(Values.Battery.CHARGE_STATUS, out _output);
         _output = _output.strip();

         string icons = _output.contains("Not Charging") ?  charge_icons[0]:
                        _output.contains("Charging")     ?  charge_icons[1]:
                        _output.contains("Discharging")  ?  charge_icons[2]:
                        _output.contains("Full")         ?  charge_icons[3]: "Error";

         label.set_label(icons+_output);

      } catch (GLib.FileError e) {
         Things.warning(e.message);
      }



      return label;
   }

}
