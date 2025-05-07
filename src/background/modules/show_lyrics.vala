#!/usr/bin/env -S vala --pkg libsoup-2.4 --pkg json-glib-1.0 --pkg gtk4

using Soup;
using Json;
using Gtk;


Label OffLyrics() {
   var lab = new Gtk.Label("");
   
   getLyric(lab);

   GLib.Timeout.add_seconds(10, () => {
      getLyric(lab);
      return true;
   });

   return lab;
}

string getArtist() {
   var command = "playerctl metadata --format '{{ artist }}'";
   string output;

   GLib.Process.spawn_command_line_sync(command, out output);
   output = output.replace(" ", "+");

   return output;
}

string getTitle() {
   var command = "playerctl metadata --format '{{ title }}'";
   string output;

   GLib.Process.spawn_command_line_sync(command, out output);
   output = output.replace(" ", "+");

   return output;
}

Label getLyric(Label lab) {
   var artist = getArtist();
   var title = getTitle();
   string url = "https://lrclib.net/api/get?artist_name=%s&track_name=%s".printf(artist, title);
   lab.set_xalign(1);
   lab.margin_end = 30;

   var session = new Soup.Session();
   var message = new Soup.Message("GET", url);
   var parser = new Json.Parser();

   session.send_message(message);
   string res = (string) message.response_body.data;

   parser.load_from_data(res, -1);
   Json.Node root = parser.get_root();
   Json.Object obj = root.get_object();

   string plainlyrics = obj.get_string_member("plainLyrics");
   lab.set_label(plainlyrics);
   return lab;
}
