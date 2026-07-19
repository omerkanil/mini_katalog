import 'package:flutter/material.dart';

// --- TEMA RENKLERİMİZ ---
const Color temaMavi = Color(0xFF1A365D); 
const Color temaKirmizi = Color(0xFFE63946); 

void main() {
  runApp(const MyApp());
}

// --- VERİ MODELLERİ ---
class Urun {
  final String ad;
  final String fiyat;
  final String detay;
  final String resimUrl;

  Urun({required this.ad, required this.fiyat, required this.detay, required this.resimUrl});

  // Gelen JSON verisindeki İngilizce etiketleri (name, price vb.) kendi yapımıza bağlıyoruz
  factory Urun.fromJson(Map<String, dynamic> json) {
    return Urun(
      ad: json['name'] ?? 'Bilinmeyen Ürün',
      fiyat: json['price'] ?? '\$0',
      detay: json['description'] ?? 'Detay bulunamadı.',
      resimUrl: json['image'] ?? 'https://via.placeholder.com/150',
    );
  }
}

// Senin paylaştığın 20 ürünlük dev veri seti
final List<Map<String, dynamic>> jsonVerisi = [
  {"id": 1, "name": "iPhone 15 Pro", "tagline": "Titanium. So strong. So light. So Pro.", "description": "The iPhone 15 Pro is the first iPhone to feature an aerospace-grade titanium design, making it lighter and more durable than ever before. It is powered by the groundbreaking A17 Pro chip, which delivers next-level gaming performance and efficiency. The device boasts a customizable Action button, replacing the traditional mute switch for quick access to your favorite features. Its pro-class camera system includes a 48MP Main camera and telephoto lenses for stunning photography in any light. Experience the future of smartphones with a display that pushes the limits of brightness.", "price": "\$999", "currency": "USD", "image": "https://wantapi.com/assets/images/iphone.png"},
  {"id": 2, "name": "iPhone 15", "tagline": "New camera. New design. Newphoria.", "description": "The iPhone 15 features a stunning new design with color-infused back glass and a contoured aerospace-grade aluminum enclosure. It introduces the Dynamic Island, bubbling up alerts and live activities so you don’t miss them. The 48MP Main camera allows for super-high-resolution photos, while the 2x Telephoto option acts like a third camera. Powered by the A16 Bionic chip, it handles advanced computational photography with ease. Now with a USB-C connector, you can charge your Mac or iPad with the same cable.", "price": "\$799", "currency": "USD", "image": "https://wantapi.com/assets/images/iphone_pink.png"},
  {"id": 3, "name": "iPhone 15 Plus", "tagline": "Huge screen. Huge battery life.", "description": "The iPhone 15 Plus offers a huge Super Retina XDR display that brings your content to life with vibrant colors and incredible detail. With its massive battery life, you can enjoy all-day usage without worrying about running out of power. The A16 Bionic chip ensures snappy performance for all your apps and games. Capture amazing photos with the advanced 48MP Main camera system, which now supports next-generation portraits. It is the perfect combination of size and power.", "price": "\$899", "currency": "USD", "image": "https://wantapi.com/assets/images/iphone_yellow.png"},
  {"id": 4, "name": "iPhone 14", "tagline": "Wonderfull.", "description": "The iPhone 14 takes a huge leap in battery life and durability, making it a total powerhouse for its price. It features a ceramic shield front that is tougher than any smartphone glass. The advanced dual-camera system lets you take beautiful photos in any light, from bright sun to low-light scenes. Powered by the A15 Bionic chip with a 5-core GPU, it delivers lightning-fast performance. With Crash Detection, the iPhone 14 can call for help when you can not.", "price": "\$699", "currency": "USD", "image": "https://wantapi.com/assets/images/iphone_blue.png"},
  {"id": 5, "name": "iPhone SE", "tagline": "Love the power. Love the price.", "description": "The iPhone SE packs the powerful A15 Bionic chip into a popular and compact design that fits perfectly in your pocket. It features a brilliant 4.7-inch Retina HD display and the home button you know and love with Touch ID. The advanced camera system features Smart HDR 4 and Deep Fusion for great photos. Durable by design, it has the toughest glass in a smartphone and is water and dust resistant. It is the most affordable way to get the incredible performance of an iPhone.", "price": "\$429", "currency": "USD", "image": "https://wantapi.com/assets/images/iphone_se.png"},
  {"id": 6, "name": "MacBook Pro 16\"", "tagline": "Mind-blowing. Head-turning.", "description": "The MacBook Pro 16-inch is the most advanced Mac laptop ever, powered by the M3 Max chip for extreme performance. Its Liquid Retina XDR display is mind-blowing, offering 1000 nits of sustained brightness for HDR content. With up to 22 hours of battery life, you can work on the most demanding projects all day long. It features a wide array of ports, including HDMI, SDXC, and MagSafe 3. This machine is designed for pros who need a laptop that can handle heavy workflows with ease.", "price": "\$2,499", "currency": "USD", "image": "https://wantapi.com/assets/images/macbook.png"},
  {"id": 7, "name": "MacBook Pro 14\"", "tagline": "Pro to the max.", "description": "The MacBook Pro 14-inch is pro to the max, featuring the M3 Pro chip for serious workflow power and efficiency. It delivers the same stunning Liquid Retina XDR display as its larger sibling but in a more compact form. The six-speaker sound system with force-cancelling woofers fills the room with clear audio. It supports up to two external displays and has a long-lasting battery. Whether you are editing video or mixing music, this laptop is built to perform.", "price": "\$1,599", "currency": "USD", "image": "https://wantapi.com/assets/images/macbook_silver.png"},
  {"id": 8, "name": "MacBook Air 15\"", "tagline": "Impressively big.", "description": "The MacBook Air 15-inch is excessively big on screen space yet impressively thin and light. Supercharged by the M2 chip, it delivers incredible speed and power efficiency for everything from work to play. The expansive 15.3-inch Liquid Retina display gives you more room to see what you love. Its fanless design means it runs completely silent even when tackling intensive tasks. With an all-day battery life, it redefines what a portable laptop can be.", "price": "\$1,299", "currency": "USD", "image": "https://wantapi.com/assets/images/macbook_air.png"},
  {"id": 9, "name": "MacBook Air 13\"", "tagline": "Don’t take it lightly.", "description": "The MacBook Air 13-inch is the world’s best-selling laptop for a reason; it combines portability with the power of the M2 chip. It features a redesigned strikingly thin aluminum enclosure that is durable and built to last. The 13.6-inch Liquid Retina display supports 1 billion colors, making text super crisp. It comes with a 1080p FaceTime HD camera so you look great on video calls. With up to 18 hours of battery life, you can leave the adapter at home.", "price": "\$1,099", "currency": "USD", "image": "https://wantapi.com/assets/images/macbook_starlight.png"},
  {"id": 10, "name": "iMac", "tagline": "Packed with power.", "description": "The iMac is the all-in-one for all, now supercharged by the M3 chip for even faster performance. Its stunning 24-inch 4.5K Retina display offers 500 nits of brightness and over a billion colors. The strikingly thin design is available in seven vibrant colors to brighten up any room. It features a 1080p FaceTime HD camera and studio-quality mics for an immersive experience. With color-matched accessories, every detail is designed for style and simplicity.", "price": "\$1,299", "currency": "USD", "image": "https://wantapi.com/assets/images/imac.png"},
  {"id": 11, "name": "iPad Pro 12.9\"", "tagline": "Supercharged by M2.", "description": "The iPad Pro 12.9-inch provides the ultimate iPad experience, supercharged by the M2 chip for groundbreaking performance. Its Liquid Retina XDR display delivers true-to-life detail with a 1,000,000:1 contrast ratio. Support for Apple Pencil hover allows you to preview your mark before you make it. With ultrafast wireless connectivity, you can connect to high-performance accessories. It is a versatile powerhouse that can replace a laptop for many creative professionals.", "price": "\$1,099", "currency": "USD", "image": "https://wantapi.com/assets/images/ipad.png"},
  {"id": 12, "name": "iPad Air", "tagline": "Light. Bright. Full of might.", "description": "The iPad Air combines serious performance with a thin and light design, making it a versatile tool for creativity. Powered by the breakthrough M1 chip, it delivers a giant leap in performance and all-day battery life. The immersive 10.9-inch Liquid Retina display features P3 wide color and an anti-reflective coating. Touch ID is built into the top button, offering a fast and secure way to unlock your iPad. Compatible with the Magic Keyboard, it adapts to whatever task you have at hand.", "price": "\$599", "currency": "USD", "image": "https://wantapi.com/assets/images/ipad_air.png"},
  {"id": 13, "name": "iPad Mini", "tagline": "Mega power. Mini sized.", "description": "The iPad Mini delivers mega power in a mini size, offering the full iPad experience designed to fit in the palm of your hand. It features an all-screen design with an 8.3-inch Liquid Retina display that is sharp and vivid. Powered by the A15 Bionic chip, it handles complex tasks and graphics-intensive games with ease. Center Stage on the 12MP Ultra Wide front camera keeps you in the frame automatically. It is perfect for taking notes or reading on the go.", "price": "\$499", "currency": "USD", "image": "https://wantapi.com/assets/images/ipad_mini.png"},
  {"id": 14, "name": "Apple Watch Ultra 2", "tagline": "Next level.", "description": "The Apple Watch Ultra 2 is the most rugged and capable Apple Watch ever, designed for endurance athletes and adventurers. It features a lightweight titanium case that is corrosion-resistant and protects the sapphire crystal. The brightest display Apple has ever created hits 3000 nits, ensuring readability in harsh sunlight. Dual-frequency GPS provides the most accurate location metrics in challenging environments. With up to 36 hours of battery life, it pushes the limits so you can too.", "price": "\$799", "currency": "USD", "image": "https://wantapi.com/assets/images/watch.png"},
  {"id": 15, "name": "Apple Watch Series 9", "tagline": "Smarter. Brighter. Mightier.", "description": "The Apple Watch Series 9 is smarter, brighter, and mightier, powered by the custom S9 SiP for a boost in performance. It introduces a magical new way to use your watch without touching the screen: Double tap your fingers. The display is twice as bright as the previous generation, making it easier to read in daylight. It offers advanced health insights to help you understand your body better. As Apple first carbon-neutral product option, it represents a major milestone.", "price": "\$399", "currency": "USD", "image": "https://wantapi.com/assets/images/watch_series9.png"},
  {"id": 16, "name": "Apple Vision Pro", "tagline": "Welcome to spatial computing.", "description": "Apple Vision Pro is a revolutionary spatial computer that seamlessly blends digital content with your physical world. It introduces a fully three-dimensional user interface controlled by your eyes, hands, and voice. The ultra-high-resolution display system packs 23 million pixels across two micro-OLED displays. Spatial Audio makes you feel like the sound is coming from the environment around you. It transforms the way you use apps, enjoy entertainment, and connect with others.", "price": "\$3,499", "currency": "USD", "image": "https://wantapi.com/assets/images/vision_pro.png"},
  {"id": 17, "name": "AirPods Pro (2nd Gen)", "tagline": "Adaptive Audio.", "description": "The AirPods Pro (2nd Generation) feature the new H2 chip, delivering smarter noise cancellation and superior sound. Adaptive Audio effectively prioritizes sounds that need your attention while reducing background noise. They offer up to 2x more Active Noise Cancellation than the previous generation, creating an oasis of silence. The MagSafe Charging Case (USB-C) now features Precision Finding and a built-in speaker. With personalized Spatial Audio, the sound is tuned specifically to your ear shape.", "price": "\$249", "currency": "USD", "image": "https://wantapi.com/assets/images/airpods.png"},
  {"id": 18, "name": "AirPods Max", "tagline": "Sound focused.", "description": "AirPods Max reimagine over-ear headphones with an Apple-designed dynamic driver that provides high-fidelity audio. Active Noise Cancellation blocks outside noise so you can immerse yourself in what you are listening to. The knit mesh canopy and ear cushions are designed for an exceptional acoustic seal and all-day comfort. Computational audio combines custom acoustic design with the Apple H1 chip for breakthrough experiences. Spatial Audio with dynamic head tracking places sounds all around you.", "price": "\$549", "currency": "USD", "image": "https://wantapi.com/assets/images/airpods_max.png"},
  {"id": 19, "name": "HomePod", "tagline": "Profound sound.", "description": "The HomePod is a powerhouse of sound, delivering high-fidelity audio that adapts to the room it is in for the best experience. It features a high-excursion woofer and a beamforming tweeter array that creates deep bass and crystal-clear highs. With room sensing technology, it automatically tunes the sound based on its location. It works seamlessly with your Apple devices and can be used as a smart home hub. Siri is built-in to help you with everyday tasks and control your music.", "price": "\$299", "currency": "USD", "image": "https://wantapi.com/assets/images/homepod.png"},
  {"id": 20, "name": "HomePod Mini", "tagline": "Color-pop.", "description": "The HomePod Mini is jam-packed with innovation, delivering unexpectedly big sound for a speaker of its size. At just 3.3 inches tall, it takes up almost no space but fills the entire room with rich 360-degree audio. It works effortlessly with your iPhone—hand off music just by bringing your phone close to the speaker. You can place multiple HomePod mini speakers around the house for a connected sound system. It is also an intelligent assistant that helps you manage your smart home.", "price": "\$99", "currency": "USD", "image": "https://wantapi.com/assets/images/homepod_mini.png"}
];

// --- ANA UYGULAMA ---
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Katalog',
      theme: ThemeData(
        scaffoldBackgroundColor: temaMavi, 
        primaryColor: temaMavi,
        appBarTheme: const AppBarTheme(
          backgroundColor: temaMavi,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: const AnaSayfa(),
    );
  }
}

// --- ANA SAYFA ---
class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  List<Urun> urunler = [];
  Map<Urun, int> sepet = {}; 

  @override
  void initState() {
    super.initState();
    urunler = jsonVerisi.map((json) => Urun.fromJson(json)).toList();
  }

  void sepeteEkle(Urun urun) {
    setState(() {
      sepet[urun] = (sepet[urun] ?? 0) + 1;
    });
  }

  void sepettenAzalt(Urun urun) {
    setState(() {
      if (sepet[urun]! > 1) {
        sepet[urun] = sepet[urun]! - 1;
      } else {
        sepet.remove(urun);
      }
    });
  }

  void sepettenTamamenSil(Urun urun) {
    setState(() {
      sepet.remove(urun);
    });
  }

  @override
  Widget build(BuildContext context) {
    int toplamUrunSayisi = sepet.values.fold(0, (toplam, adet) => toplam + adet);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Discover',
          style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 28),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SepetSayfasi(
                        sepet: sepet,
                        urunEkle: sepeteEkle,
                        urunAzalt: sepettenAzalt,
                        urunSil: sepettenTamamenSil,
                      ),
                    ),
                  ).then((_) {
                    setState(() {}); 
                  });
                },
              ),
              if (toplamUrunSayisi > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: temaKirmizi,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                    child: Text(
                      '$toplamUrunSayisi',
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Find your perfect device',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                style: TextStyle(color: temaMavi),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: temaMavi),
                  border: InputBorder.none,
                  hintText: 'Search products...',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://wantapi.com/assets/banner.png',
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 100,
                  color: Colors.white.withOpacity(0.1),
                  child: const Center(child: Text('Banner Yüklenemedi', style: TextStyle(color: Colors.white))),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: urunler.length,
                itemBuilder: (context, index) {
                  return UrunKarti(
                    urun: urunler[index],
                    sepeteEkle: () => sepeteEkle(urunler[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- ÜRÜN KARTI ---
class UrunKarti extends StatelessWidget {
  final Urun urun;
  final VoidCallback sepeteEkle;

  const UrunKarti({super.key, required this.urun, required this.sepeteEkle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UrunDetaySayfasi(urun: urun, sepeteEkle: sepeteEkle),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  // Burada ikonu kaldırdık, gerçek ürün resmini koyduk!
                  child: Image.network(
                    urun.resimUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              urun.ad,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: temaMavi),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              urun.fiyat,
              style: const TextStyle(color: temaKirmizi, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// --- ÜRÜN DETAY SAYFASI ---
class UrunDetaySayfasi extends StatelessWidget {
  final Urun urun;
  final VoidCallback sepeteEkle;

  const UrunDetaySayfasi({
    super.key,
    required this.urun,
    required this.sepeteEkle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(urun.ad, style: const TextStyle(color: Colors.white, fontSize: 18)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                // Detay sayfasındaki devasa ikon yerine ürünün gerçek resmi geldi
                child: Image.network(
                  urun.resimUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 100, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              urun.ad,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              urun.fiyat,
              style: const TextStyle(fontSize: 26, color: temaKirmizi, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  urun.detay,
                  style: const TextStyle(fontSize: 16, color: Colors.white70, height: 1.5),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: temaKirmizi, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  sepeteEkle();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${urun.ad} sepete eklendi!', style: const TextStyle(color: Colors.white)),
                      backgroundColor: temaKirmizi,
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text(
                  'Add to Cart', 
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- SEPET SAYFASI ---
class SepetSayfasi extends StatefulWidget {
  final Map<Urun, int> sepet;
  final Function(Urun) urunEkle;
  final Function(Urun) urunAzalt;
  final Function(Urun) urunSil;

  const SepetSayfasi({
    super.key, 
    required this.sepet, 
    required this.urunEkle, 
    required this.urunAzalt, 
    required this.urunSil
  });

  @override
  State<SepetSayfasi> createState() => _SepetSayfasiState();
}

class _SepetSayfasiState extends State<SepetSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: widget.sepet.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.remove_shopping_cart_outlined, size: 80, color: Colors.white54),
                  SizedBox(height: 20),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.sepet.length,
              itemBuilder: (context, index) {
                final urun = widget.sepet.keys.elementAt(index);
                final adet = widget.sepet[urun]!;

                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // Sepetteki ikonları da ürün görselleriyle değiştirdik
                          child: Image.network(
                            urun.resimUrl,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(urun.ad, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: temaMavi)),
                              const SizedBox(height: 4),
                              Text(urun.fiyat, style: const TextStyle(color: temaKirmizi, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline, color: temaMavi),
                              onPressed: () {
                                widget.urunAzalt(urun);
                                setState(() {}); 
                              },
                            ),
                            Text(
                              '$adet',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: temaMavi),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline, color: temaMavi),
                              onPressed: () {
                                widget.urunEkle(urun);
                                setState(() {}); 
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline, color: temaKirmizi),
                              onPressed: () {
                                widget.urunSil(urun);
                                setState(() {}); 
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}