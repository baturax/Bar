#!/usr/bin/env -S vala --pkg libsoup-2.4 --pkg json-glib-1.0

using Soup;
using Json;

void main()
{
   string lat = "41.0082";
   string long = "28.9784";
   var uri = "https://api.open-meteo.com/v1/forecast?latitude=%s&longitude=%s&current=apparent_temperature,rain,is_day,relative_humidity_2m&timezone=auto&forecast_days=3".printf(lat, long);
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


      string apparent_temperature = apparent_temperature_api.to_string();

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

      stdout.printf("""
      Time:       %s
      Weather:    %s
      Day:        %s
      Temp:       %s

      """, time, rain, is_day, apparent_temperature);

   } catch (Error e) {
      stdout.printf(e.message);
   }
}
