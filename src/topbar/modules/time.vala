using Gtk;
using GLib;

class Time {
   public static Label show_time()
   {
      var clock = new Gtk.Label("");

      getTime(clock);

      GLib.Timeout.add_seconds(60, () => {
         getTime(clock);
         return true;
      });

      return(clock);
   }

   private static Gtk.Label getTime(Gtk.Label label) {
      var time = new GLib.DateTime.now_local();
      label.set_label(Values.Time.CLOCK_IMAGE + time.format(Values.Time.CLOCK_FORMAT));
      label.set_tooltip_text(Values.Time.CLOCK_IMAGE + time.format(Values.Time.CLOCK_TOOLTIP_FORMAT));

      return label;
   }
}
