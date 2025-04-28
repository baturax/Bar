// mybar.vala

using Gtk;
using GtkLayerShell;

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

            //  Don't tuch

        GtkLayerShell.init_for_window(background_window);
        GtkLayerShell.set_layer(background_window, GtkLayerShell.Layer.BACKGROUND);
        background_window.present();
    }
}

int main(string[] args) {
    return new MyBar().run(args);
}
