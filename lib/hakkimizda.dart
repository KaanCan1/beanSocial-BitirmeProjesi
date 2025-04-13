import 'package:beansocial/footerr.dart';
import 'package:beansocial/header.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Hakkimizda extends StatelessWidget {
  const Hakkimizda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 246, 246, 246), // Cream background color
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Header(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 10), // Padding only on content area
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lottie animation at the top
              Center(
                child: Lottie.asset(
                  'assets/animasyon.json', // Ensure this is the correct file path
                  height: 150,
                ),
              ),
              const SizedBox(height: 20),

              // Title with improved styling
              Center(
                child: Text(
                  'Hakkımızda',
                  style: TextStyle(
                    fontSize: 32, // Larger font size for title
                    fontWeight: FontWeight.bold,
                    color: Colors
                        .brown.shade800, // Darker brown color for contrast
                    fontFamily: 'Roboto', // Elegant font family
                    letterSpacing: 1.2, // Slight letter spacing for readability
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Introduction paragraph
              const Text(
                'BeanSocial, kahve severlerin bir araya gelerek kahve kültürünü keşfettikleri ve deneyimlerini paylaştıkları bir sosyal platformdur. Kahveye tutkusu olanları bir araya getiren bu uygulama, kahve çekirdeklerine ve sosyal etkileşime dair güçlü bir bağ kurmaktadır.',
                style: TextStyle(
                  fontSize: 18, // Slightly larger text for body
                  color: Colors.black87,
                  height: 1.5, // Improved line spacing for readability
                  fontFamily: 'Arial', // Modern sans-serif font
                ),
              ),
              const SizedBox(height: 20),

              // Section Title with improved styling
              Text(
                '1. Uygulama Fikir Aşaması ve İsim Belirlenmesi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade800,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '''Öncelikle, uygulama fikrinin temel amacını belirledim: Kahve severlerin etkileşimde bulunabileceği, kahve çeşitlerini keşfederek deneyimlerini paylaşabileceği sosyal bir platform oluşturmak. Fikir aşamasında, kahveye dair tarifler, öneriler ve kullanıcıların deneyimlerini paylaşabileceği bir alan yaratmak istedim. Kahveye tutkusu olanları bir araya getirecek, sosyal bir topluluk sunacak bu uygulama için isim seçeneklerini düşündüm. Kahve kültürüne ve sosyal yapıya uygun bir isim olarak BeanSocial’ı seçtim. Bu isim, hem kahve çekirdeklerine hem de sosyal etkileşime gönderme yaparak uygulamanın ruhunu yansıtıyor.''',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),

              // Additional sections
              Text(
                '2. Uygulama İçinde Kullanılacak Yapılar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade800,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '''• Kişiselleştirilmiş Kahve Önerileri: Kullanıcılar, kahve damak zevkleri ve içim alışkanlıklarına göre kahve önerileri alabilir. Örneğin, sütlü kahve seven bir kullanıcıya latte ve flat white önerileri sunulurken, sert kahvelerden hoşlananlara espresso çeşitleri önerilebilir. Bu öneriler, kullanıcının seçtiği seçimler ile önerilecektir.

• Sosyal Paylaşım ve Etkileşim: Kullanıcılar, kahve tariflerini, kendi kahve yapım deneyimlerini ve içtikleri kahvelerin fotoğraflarını paylaşabilir. Diğer kullanıcıların gönderilerine yorum yapabilir, beğeni bırakabilir veya paylaşabilirler. Bu bölüm tıpkı bizim kullandığımız sosyal medya uygulamaları gibi bir bölüm ana sayfa akışı eklenecek.

• Kahve Bilgi Rehberi: Uygulamada kahve çekirdek türlerinden demleme yöntemlerine, öğütme derecelerinden su sıcaklıklarına kadar kapsamlı bir rehber bulunacak. Kullanıcılar, kahve dünyasına dair bilgi edinmek için bu rehberi kullanabilir ve dilerlerse kendi kahve demleme metodlarını buraya ekleyebilir.

• Kahve Tadım Notları ve Puanlama: Kahve severler, denedikleri kahve çeşitlerine puan verip tadım notları (yorum) bırakabilir. Örneğin, asidite, gövde, aroma gibi özellikleri derecelendirebilir (0-5 puan arasında örneğin) ve kahve hakkında notlarını diğer kullanıcılarla paylaşabilir.

• Kahve Aboneliği ve Kahve Çekirdeği Önerileri: Kullanıcılar, damak zevklerine göre seçilmiş kahve çekirdeklerinden oluşan haftalık veya aylık abonelik paketlerine kaydolabilir. Bu sayede her ay yeni ve farklı kahveler deneyebilirler.''',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),

              // Additional sections
              Text(
                '3. Kullanılacak Dil ve Platform Seçimi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade800,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '''Yaz dönemi stajımda flutter ile proje geliştirme şansı bulmuştum ve dili sevdiğim için bu projeyi de flutter ile geliştirmeye karar verdim. IOS ortamında emülatör üzerinden çalıştırarak test edip uygulamayı o şekilde geliştireceğim.''',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),

              // Additional sections
              Text(
                '4. Proje Tasarım Aşaması ve Kodlanmaya Başlanması',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade800,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '''Bu bölümde projemi Figma üzerinden genel hatlarıyla tasarlayıp, kod kısmında ise vscode editörü ile kodlayacağım. Aşağıda tasarıma dair birkaç yaptığım denemeleri ekledim, ileriki zamanlarda tasarımın üzerinden tekrar geçilecek.''',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
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
}
