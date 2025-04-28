// ! WALLPAPER

using Gtk;
using GtkLayerShell;

const string bg = "/home/arch/Pictures/Wallpaper/arch.jpg";

class MyBar : Gtk.Application {
    public MyBar() {
        Object(application_id: "bai.bai.Bar");
    }

    protected override void activate() {

            // Main App
        var background_window = new Gtk.ApplicationWindow(this) {
            title = "31",
            default_height = 1080,
            default_width = 1920,
        };

            //  Shell
        GtkLayerShell.init_for_window(background_window);
        GtkLayerShell.set_layer(background_window, GtkLayerShell.Layer.BACKGROUND);
        
            //  Wallpaper
        var bg_image = new Gtk.Image.from_file(bg);
        bg_image.set_pixel_size(1920);
        
        background_window.child = bg_image;
        background_window.present();
    }
    public static int main(string[] args) {
        return new MyBar().run(args);
    }
}

