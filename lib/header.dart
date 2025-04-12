import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:get/get.dart';
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 900) {
            // Mobil görünüm
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _logoSection(context),
                Row(
                  children: [
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        _handleMenuSelection(value, context);
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          _popupMenuItem('Ana Sayfa', '/AnaSayfa'),
                          _popupMenuItem('Anketler', '/anketSayfa'),
                          _popupMenuItem('Kahveler', 'kahveler'),
                          _popupMenuItem('SSS', '/sss'),
                          _popupMenuItem('Hakkımızda', 'hakkimizda'),
                        ];
                      },
                      child: const Icon(Icons.menu,
                          color: Color.fromARGB(255, 81, 80, 80)),
                    ),
                    const SizedBox(width: 16),
                    _authButtons(context),
                  ],
                ),
              ],
            );
          } else {
            // Masaüstü görünüm
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _logoSection(context),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _headerButton(context, 'Ana Sayfa', '/AnaSayfa'),
                      _headerButton(context, 'Anketler', '/anketSayfa'),
                      _headerButton(context, 'Kahveler', '/kahveler'),
                      _headerButton(context, 'SSS', '/sss'),
                      _headerButton(context, 'Hakkımızda', '/hakkimizda'),
                    ],
                  ),
                ),
                _authButtons(context),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _logoSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/AnaSayfa');
      },
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/logoBeanSocial.svg',
            semanticsLabel: 'Logo',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          const Text(
            'BeanSocial',
            style: TextStyle(
              color: Colors.brown,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _authButtons(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: const Text(
            'Giriş Yap',
            style: TextStyle(color: Colors.brown),
          ),
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/signup');
          },
          child: const Text(
            'Kayıt Ol',
            style: TextStyle(color: Colors.brown),
          ),
        ),
      ],
    );
  }

  Future<void> _handleMenuSelection(String value, BuildContext context) async {
    if (value.startsWith('/')) {
      Navigator.pushReplacementNamed(context, value);
    } else {
      // Harici bir URL ise
      // launchUrl kullanabilirsiniz, ancak bunu eklemeyi unutmayın
    }
  }

  Widget _headerButton(BuildContext context, String text, String url) {
    return TextButton(
      onPressed: () => _handleMenuSelection(url, context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          text,
          style: const TextStyle(color: Color.fromARGB(255, 81, 80, 80)),
        ),
      ),
    );
  }

  PopupMenuItem<String> _popupMenuItem(String text, String url) {
    return PopupMenuItem<String>(
      value: url,
      child: Text(text),
    );
  }
}
