import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF9),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 900;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _logoSection(context),
              if (isMobile) _mobileMenu(context) else _desktopMenu(context),
            ],
          );
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
            width: 46,
            height: 46,
          ),
          const SizedBox(width: 12),
          Text(
            'BeanSocial',
            style: GoogleFonts.greatVibes(
              textStyle: const TextStyle(
                fontSize: 26,
                color: Color(0xFF6F4E37),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mobileMenu(BuildContext context) {
    return Row(
      children: [
        PopupMenuButton<String>(
          onSelected: (value) => _handleMenuSelection(value, context),
          itemBuilder: (context) => [
            _popupMenuItem('Ana Sayfa', '/AnaSayfa'),
            _popupMenuItem('Anketler', '/anketSayfa'),
            _popupMenuItem('Kahveler', '/kahveler'),
            _popupMenuItem('SSS', '/sss'),
            _popupMenuItem('Hakkımızda', '/hakkimizda'),
          ],
          icon: const Icon(Icons.menu_rounded, color: Colors.brown),
        ),
        const SizedBox(width: 12),
        _authOrProfile(context),
      ],
    );
  }

  Widget _desktopMenu(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _headerButton(context, 'Ana Sayfa', '/AnaSayfa'),
        _headerButton(context, 'Anketler', '/anketSayfa'),
        _headerButton(context, 'Kahveler', '/kahveler'),
        _headerButton(context, 'SSS', '/sss'),
        _headerButton(context, 'Hakkımızda', '/hakkimizda'),
        const SizedBox(width: 24),
        _authOrProfile(context),
      ],
    );
  }

  Widget _headerButton(BuildContext context, String label, String route) {
    return TextButton(
      onPressed: () => _handleMenuSelection(route, context),
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF6F4E37),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.nunito(
          textStyle: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _authOrProfile(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkLoginStatus(),
      builder: (context, snapshot) {
        final isLoggedIn = snapshot.data ?? false;

        if (isLoggedIn) {
          return TextButton(
            onPressed: () => Navigator.pushNamed(context, '/profile'),
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF6F4E37),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Icon(
              Icons.account_circle,
              size: 28,
              color: Color(0xFF6F4E37),
            ),
          );
        } else {
          return Row(
            children: [
              TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/login'),
                child: const Text(
                  'Giriş Yap',
                  style: TextStyle(color: Colors.brown),
                ),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/signup'),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6F4E37),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Text(
                    'Kayıt Ol',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  PopupMenuItem<String> _popupMenuItem(String label, String route) {
    return PopupMenuItem<String>(
      value: route,
      child: Text(label),
    );
  }

  void _handleMenuSelection(String value, BuildContext context) {
    Navigator.pushReplacementNamed(context, value);
  }

  Future<bool> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
