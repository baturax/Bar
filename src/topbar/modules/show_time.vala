using Gtk;
using GLib;

class ShowTime {
   public static Label show_time()
   {
      var clock = new Gtk.Label("");

      clock.set_valign(Gtk.Align.CENTER);

      GLib.Timeout.add_seconds(2, () => {
         var c_time = new GLib.DateTime.now_local();
         clock.set_label(Value.Time.CLOCK_IMAGE + c_time.format(Value.Time.CLOCK_FORMAT));
         clock.set_tooltip_text(Value.Time.CLOCK_IMAGE + c_time.format(Value.Time.CLOCK_TOOLTIP_FORMAT));
         return(true);
      });
      return(clock);
   }
}
