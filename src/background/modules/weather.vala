using Soup;
using Json;

Gtk.Label weather() {
   var lab = new Gtk.Label("");
   get_things(lab);
   return lab;
}

Gtk.Label get_things(Gtk.Label lab) {
   string uri = "https://api.open-meteo.com/v1/forecast?latitude=%s&longitude=%s&current=apparent_temperature,rain,is_day,relative_humidity_2m&timezone=auto&forecast_days=3".printf(Values.LAT, Values.LONG);
   var session = new Soup.Session ();
   var message = new Soup.Message ("GET", uri);
   session.send_message (message);

   try {
      var parser = new Json.Parser();
      parser.load_from_data ((string) message.response_body.flatten ().data, -1);

      var root_object = parser.get_root ().get_object ();
      var current = root_object.get_object_member("current");

      string time_api = current.get_string_member("time");
      double rain_api = current.get_double_member("rain");
      double is_day_api = current.get_double_member("is_day");
      double apparent_temperature_api = current.get_double_member("apparent_temperature");


      string apparent_temperature = "%.1f".printf(apparent_temperature_api);

      string is_day = "";
      if (is_day_api == 1.0) {
         is_day = "☀️";
      } else if (is_day_api != 1) {
         is_day = "🌙";
      }

      string time = time_api.replace("T", " ");

      string rain = "";
      if (rain_api == 0.0) {
         rain = "☁️";
      } else if (rain_api != 0.0) {
         rain = "🌧️";
      }

      
string text = """
    <span font='20'>Time: %s</span>
    <span font='24' color='blue'>Weather: %s</span>
    <span font='18' weight='bold'>Day: %s</span>
    <span font='22' foreground='green'>Temperature: %s°C</span>
""".printf(time, rain, is_day, apparent_temperature);

lab.set_markup(text);



   } catch (Error e) {
      stdout.printf(e.message);
   }
   return lab;
}
