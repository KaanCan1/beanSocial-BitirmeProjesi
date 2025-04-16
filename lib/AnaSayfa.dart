import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:beansocial/footerr.dart';
import 'package:beansocial/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int _currentIndex = 0;

  // Resimlerin yolları
  final List<String> _imagePaths = [
    'assets/logoBeanSocial.svg', // 1. resmin yolu
    'assets/logoBeanSocial.svg', // 2. resmin yolu
    'assets/logoBeanSocial.svg', // 3. resmin yolu
  ];

  // Timer fonksiyonu ile 1 saniye arayla resmi değiştirme
  void _changeImage() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _imagePaths.length;
      });
      _changeImage();
    });
  }

  @override
  void initState() {
    super.initState();
    _changeImage(); // Resim değişimini başlatıyoruz
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Header(), // Burada Header widget'ını kullanıyoruz
      ),
      body: SingleChildScrollView(
        // Wrap the whole body in SingleChildScrollView
        child: Column(
          children: <Widget>[
            // Centered Text and Animations
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: SizedBox(
                width: 400,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Agne',
                    color: Colors.black,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        'assets/animasyon.json',
                        height: 150,
                      ),
                      const SizedBox(height: 20),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText('BeanSocial'),
                          TypewriterAnimatedText('Kahveler'),
                          TypewriterAnimatedText('Ve Siz'),
                        ],
                        repeatForever: false,
                        totalRepeatCount: 1,
                        pause: const Duration(milliseconds: 500),
                        onTap: () {},
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Image with AnimatedSwitcher
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: SvgPicture.asset(
                _imagePaths[_currentIndex], // Current image
                key: ValueKey<int>(_currentIndex),
                semanticsLabel: 'Anket',
                width: 500,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Footer widget
            const Footerr(
              children: [], // Add content to the footer if needed
            ),
          ],
        ),
      ),
    );
  }
}
