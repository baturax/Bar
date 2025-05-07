using Gtk;
using GtkLayerShell;

public class Bar_bg : Gtk.Application {
   public Bar_bg()
   {
      Object(application_id: Values.APP_ID);
   }

   public override void activate()
   {
      var window = new Gtk.ApplicationWindow(this)
      {
         default_height = Values.HEIGHT,
         default_width  = Values.WIDTH,
      };

      //  Shell
      GtkLayerShell.init_for_window(window);
      GtkLayerShell.set_layer(window, GtkLayerShell.Layer.BACKGROUND);

      var bg_picture = new Gtk.Picture.for_filename(Values.BG_IMAGE);

      var overlay = new Gtk.Overlay();
      overlay.set_child(bg_picture);
      overlay.add_overlay(OffLyrics());

      window.child = overlay;
      window.present();
   }

   public static int main(string[] args)
   {
      return(new Bar_bg().run(args));
   }
}
