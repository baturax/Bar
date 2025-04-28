// mybar.vala

using Gtk;
using GtkLayerShell;

class MyBar : Gtk.Application {
    public MyBar() {
        Object(application_id: "bai.bai.Bar");
    }

    protected override void activate() {
        var window = new Gtk.ApplicationWindow(this);

        // Layer-Shell başlat
        GtkLayerShell.init_for_window(window);

        // Layer'ı top olarak ayarla (en üst katman)
        GtkLayerShell.set_layer(window, Layer.BACKGROUND);

        // Paneli ekranın üst kısmına sabitle
        GtkLayerShell.set_anchor(window, Edge.TOP, true);
        GtkLayerShell.set_anchor(window, Edge.LEFT, true);
        GtkLayerShell.set_anchor(window, Edge.RIGHT, true);

        // Pencereyi dekorasyonsuz yap
        window.set_decorated(false);

        // Pencerenin yüksekliğini 30px sabitle
        window.set_size_request(1920, 1080);  // genişlik serbest, yükseklik 30px

        // Arka plan rengi ve içerik
        var box = new Box(Orientation.HORIZONTAL, 10);
        box.set_margin_start(10);
        box.set_margin_end(10);

        var clock = new Label("");
        var btn = new Button.with_label("Click Me");

        box.append(clock);
        box.append(btn);
        window.set_child(box);

        // Basit saat güncellemesi
        Timeout.add_seconds(1, () => {
            var current_time = new DateTime.now_local();
            clock.set_label(current_time.format("%H:%M:%S"));
            return true; // tekrar çalışsın
        });

        window.present();
    }
}

int main(string[] args) {
    return new MyBar().run(args);
}
