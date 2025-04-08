import 'package:beansocial/footerr.dart';
import 'package:beansocial/header.dart';
import 'package:flutter/material.dart';

class SSS extends StatelessWidget {
  const SSS({super.key});

  @override
  Widget build(BuildContext context) {
    // Ekranın genişliğini ve yüksekliğini alıyoruz
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // Ölçekleme faktörü: Ekran genişliğine göre öğelerin boyutlarını orantılı ayarlamak için kullanıyoruz
    double scaleFactor = width / 375; // 375, baz alınan ekran genişliği (örnek)

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Header(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Başlık kısmı (Sıkça Sorulan Sorular)
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height *
                      0.01), // Dikey padding, ekranın yüksekliğine göre ayarlanıyor
              child: Center(
                child: Text(
                  'Sıkça Sorulan Sorular',
                  style: TextStyle(
                    fontSize: 15 *
                        scaleFactor, // Font boyutu, ekran genişliğine göre ölçekleniyor
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 234, 111, 23),
                  ),
                ),
              ),
            ),
            // Sıkça Sorulan Sorular Listesi
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.05,
                  horizontal: width * 0.04), // Responsive padding
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FAQItem(
                    question: '1. BeanSocial nedir?',
                    answer:
                        'BeanSocial, kahve severlerin kahve çeşitlerini keşfedeceği, kahve tariflerini paylaşacağı ve sosyal etkileşimde bulunabileceği bir platformdur.',
                  ),
                  SizedBox(height: 15),
                  FAQItem(
                    question: '2. Uygulama nasıl çalışır?',
                    answer:
                        'Uygulama, kullanıcıların kahve tercihlerine göre kişiselleştirilmiş öneriler sunar, sosyal medya benzeri bir ortamda kahve fotoğrafları ve tariflerini paylaşmalarına imkan tanır.',
                  ),
                  SizedBox(height: 15),
                  FAQItem(
                    question: '3. Kahve aboneliği nasıl yapılır?',
                    answer:
                        'Kullanıcılar, damak zevklerine uygun kahve çekirdekleri seçebilir ve aylık/haftalık kahve aboneliği paketlerine abone olabilir.',
                  ),
                  SizedBox(height: 15),
                  FAQItem(
                    question: '4. Kahve hakkında nasıl bilgi edinebilirim?',
                    answer:
                        'Uygulama içinde, kahve türleri, demleme yöntemleri ve diğer kahve bilgilerine dair kapsamlı bir rehber bulunmaktadır.',
                  ),
                  SizedBox(height: 15),
                  FAQItem(
                    question: '5. Şifremi unuttum, ne yapmalıyım?',
                    answer:
                        'Şifrenizi unuttuysanız, giriş ekranında "Şifremi Unuttum" seçeneğini tıklayarak şifrenizi sıfırlayabilirsiniz.',
                  ),
                ],
              ),
            ),
            // Footer'ı en altta tutuyoruz
            const Footerr(
              children: [], // Footer içeriği buraya eklenebilir
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // Ölçekleme faktörü: Ekran genişliğine göre öğelerin boyutlarını orantılı hale getiriyor
    double scaleFactor = width / 800;

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 150), // Kartın sağ ve sol boşlukları
      child: Card(
        elevation: 2, // Kartın gölgesi
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(8), // Kartın köşelerini yuvarlatıyoruz
        ),
        child: Padding(
          padding: EdgeInsets.all(16 *
              scaleFactor), // İçerideki padding, ekran boyutuna göre ayarlanıyor
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question,
                style: TextStyle(
                  fontSize: 9 *
                      scaleFactor, // Soru metninin font boyutu, ekran genişliğine göre
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 246, 123, 78),
                ),
              ),
              SizedBox(
                  height: 1 * scaleFactor), // Soru ve cevap arasındaki boşluk
              Text(
                answer,
                style: TextStyle(
                  fontSize: 8 *
                      scaleFactor, // Cevap metninin font boyutu, ekran genişliğine göre
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
