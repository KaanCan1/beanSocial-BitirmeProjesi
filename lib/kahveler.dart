import 'package:beansocial/footerr.dart';
import 'package:beansocial/header.dart';
import 'package:flutter/material.dart';

class CoffeeProduct {
  final String title;
  final String subtitle;
  final String notes;
  final double intensity;
  final double roast;
  final String weight;
  final double price;
  final double pricePerKg;
  final String imagePath;

  const CoffeeProduct({
    required this.title,
    required this.subtitle,
    required this.notes,
    required this.intensity,
    required this.roast,
    required this.weight,
    required this.price,
    required this.pricePerKg,
    required this.imagePath,
  });
}

class Kahveler extends StatelessWidget {
  const Kahveler({super.key});

  final List<CoffeeProduct> coffeeProducts = const [
    CoffeeProduct(
      title: '»Kitale Kenya«',
      subtitle: 'Rarität Kahve',
      notes: 'Kırmızı Frenk Üzümü ve Bal',
      intensity: 4.5,
      roast: 3.0,
      weight: '250 g Çekirdek Kahve',
      price: 349.90,
      pricePerKg: 1399.60,
      imagePath: 'assets/coffee_images/kitale_kenya.jpg',
    ),
    CoffeeProduct(
      title: 'Colombia Supremo',
      subtitle: 'Premium Kahve',
      notes: 'Meyvemsi ve Fındıksı Notlar',
      intensity: 3.5,
      roast: 2.5,
      weight: '250 g Çekirdek Kahve',
      price: 299.90,
      pricePerKg: 1199.60,
      imagePath: 'assets/coffee_images/kitale_kenya.jpg',
    ),
    CoffeeProduct(
      title: 'Ethiopia Yirgacheffe',
      subtitle: 'Özel Seçim',
      notes: 'Çiçeksi ve Narenciye Notları',
      intensity: 4.0,
      roast: 2.0,
      weight: '250 g Çekirdek Kahve',
      price: 379.90,
      pricePerKg: 1519.60,
      imagePath: 'assets/coffee_images/kitale_kenya.jpg',
    ),
    CoffeeProduct(
      title: 'Tchibo Caffè Crema',
      subtitle: 'Premium Roast',
      notes: 'Zengin ve pürüzsüz lezzet',
      intensity: 3.5,
      roast: 3.0,
      weight: '250 g Çekirdek Kahve',
      price: 8.99,
      pricePerKg: 35.96,
      imagePath: 'assets/coffee_images/kitale_kenya.jpg',
    ),
    CoffeeProduct(
      title: 'Tchibo Espresso Bar',
      subtitle: 'Yoğun Espresso',
      notes: 'Cesur ve kuvvetli',
      intensity: 4.5,
      roast: 4.0,
      weight: '250 g Çekirdek Kahve',
      price: 9.49,
      pricePerKg: 37.96,
      imagePath: 'assets/coffee_images/kitale_kenya.jpg',
    ),
    CoffeeProduct(
      title: 'Tchibo Gold Selection',
      subtitle: 'Lüks Karışım',
      notes: 'Dengeli ve aromatik',
      intensity: 3.0,
      roast: 2.5,
      weight: '250 g Çekirdek Kahve',
      price: 10.99,
      pricePerKg: 43.96,
      imagePath: 'assets/coffee_images/kitale_kenya.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Header(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
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
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: coffeeProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = coffeeProducts[index];
                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            contentPadding: const EdgeInsets.all(10),
                            title: Center(
                              child: Text(
                                product.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    product.imagePath,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  product.notes,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildInfoItem(
                                      icon: Icons.terrain,
                                      label: 'Rakım',
                                      content: Text(
                                        product.weight,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    _buildInfoItem(
                                      icon: Icons.opacity,
                                      label: 'Yoğunluk',
                                      content:
                                          _buildBeanRating(product.intensity),
                                    ),
                                    _buildInfoItem(
                                      icon: Icons.local_fire_department,
                                      label: 'Kavurma',
                                      content: _buildBeanRating(product.roast),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  children: [
                                    Text(
                                      '${product.price.toStringAsFixed(2)} TL',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.brown,
                                      ),
                                    ),
                                    Text(
                                      'TL/kg ${product.pricePerKg.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Kapat'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                product.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              product.notes.length > 60
                                  ? '${product.notes.substring(0, 60)}...'
                                  : product.notes,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Footerr(children: []),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBeanRating(double rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        double diff = rating - index;
        if (diff >= 1) {
          return Image.asset(
            'assets/coffee_images/coffee_bean_full.png',
            width: 20,
            height: 20,
          );
        } else if (diff >= 0.5) {
          return Image.asset(
            'assets/coffee_images/coffee_bean_half.png',
            width: 20,
            height: 20,
          );
        } else {
          return Image.asset(
            'assets/coffee_images/coffee_bean_empty.png',
            width: 20,
            height: 20,
          );
        }
      }),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required Widget content,
  }) {
    return Column(
      children: [
        Icon(icon, color: Colors.brown[400]),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 3),
        content,
      ],
    );
  }
}
