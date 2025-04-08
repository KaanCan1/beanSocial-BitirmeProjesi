import 'package:beansocial/footerr.dart';
import 'package:beansocial/header.dart';
import 'package:flutter/material.dart';

class Kahveler extends StatelessWidget {
  const Kahveler({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Header(), // Header widget'ı burada kullanılıyor
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Başlık
              const Center(
                child: Text(
                  'Kahve Bilgilendirme Sayfası',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // GridView ile 4 sütunda kahve kartları yaptım
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 sütun
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        // Resim
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/coffee_images/$index.jpg'), // Resim yolu
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Kahve İsmi
                        Text(
                          _getCoffeeName(index),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Kahve Özellikleri
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Yetiştiği Rakım: ${index * 200 + 500} m\nAsidite: ${index % 5 == 0 ? 'Yüksek' : 'Orta'}\nAroma: ${index % 3 == 0 ? 'Çikolata' : 'Meyve'}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              // Footer
              const Footerr(
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Kahve isimlerini döndüren metot
  String _getCoffeeName(int index) {
    switch (index) {
      case 0:
        return 'Colombia';
      case 1:
        return 'Ethiopia';
      case 2:
        return 'Brazil';
      case 3:
        return 'Kenya';
      case 4:
        return 'Costa Rica';
      case 5:
        return 'Panama';
      case 6:
        return 'Guatemala';
      case 7:
        return 'Peru';
      default:
        return 'Unknown';
    }
  }
}
