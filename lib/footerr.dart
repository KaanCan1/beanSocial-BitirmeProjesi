import 'package:flutter/material.dart';
import 'package:beansocial/header.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;

  const CustomScaffold({
    required this.child,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Header(),
      ),
      body: Column(
        children: [
          Expanded(child: child), // Sayfanın ana içeriği burada
        ],
      ),
    );
  }
}

class Footerr extends StatelessWidget {
  const Footerr({
    super.key,
    required List children,
  });

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('Başlatılamadı $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.3,
      //bu tarz sayıları class'ta topla en son
      color: Colors.grey[50],
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Bizi takip edin', style: FontSizeFooter.headerSize),
                const SizedBox(height: 10.0),
                IconButton(
                  icon: const Icon(Icons.facebook_rounded),
                  color: Colors.blue,
                  onPressed: () => _launchURL('https://google.com'),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Sayfalar', style: FontSizeFooter.headerSize),
                _footerLink('Anasayfa', 'https://google.com'),
                _footerLink('Anketler', 'https://google.com'),
                _footerLink('Kahveler ve Daha Fazlası', 'https://google.com'),
                _footerLink('Hakkımızda', 'https://google.com'),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Kurumsal', style: FontSizeFooter.headerSize),
                _footerLink('Çerez Politikası', 'https://google.com'),
                _footerLink(
                    'Çerez Politikası Aydınlatma Metni', 'https://google.com'),
                _footerLink('Kişisel Verileri Saklama ve İmka Politikası',
                    'https://google.com'),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Bize Ulaşın', style: FontSizeFooter.headerSize),
                const Text(
                  'Tokat Gaziosmanpaşa University, Taşlıçiftlik Campus, 60250 Tokat / TÜRKİYE',
                  style: FontSizeFooter.footerSize,
                ),
                const SizedBox(height: 10.0),
                _wwwLink('Mail Gönderin!', 'mailto:kaancan368368@gmail.com'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String text, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(text, style: FontSizeFooter.footerSize),
      ),
    );
  }

  Widget _wwwLink(String text, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(text, style: FontSizeFooter.headerSize),
      ),
    );
  }
}

class FontSizeFooter {
  static const TextStyle footerSize = TextStyle(
    fontSize: 12,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle headerSize = TextStyle(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
}
