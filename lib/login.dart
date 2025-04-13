import 'package:beansocial/footerr.dart';
import 'package:beansocial/giris_kontrol.dart';
import 'package:beansocial/header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Örnek giriş bilgileri:
  final String ornekEmail = "kaan@gmail.com";
  final String ornekSifre = "kaan2003";

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (_emailController.text.trim() == ornekEmail &&
        _passwordController.text == ornekSifre) {
      await AuthService.login(); // giriş durumunu kaydet

      Navigator.pushReplacementNamed(context, '/AnaSayfa');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Giriş başarısız, lütfen bilgilerinizi kontrol edin."),
        ),
      );
    }
  }

  Widget _buildInput(String label,
      {bool isPassword = false, TextEditingController? controller}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.brown),
        filled: true,
        fillColor: const Color(0xFFFAF5F0),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F3),
      // LoginPage'de kullanıcı henüz giriş yapmadığından Header default olarak isLoggedIn: false.
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Header(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;
          final width = constraints.maxWidth;

          return Column(
            children: [
              Expanded(
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Lottie.asset(
                              'assets/animasyon.json',
                              height: height * 0.15,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Giriş Yap',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w600,
                                color: Colors.brown[700],
                              ),
                            ),
                            const SizedBox(height: 24),
                            _buildInput('Email', controller: _emailController),
                            const SizedBox(height: 16),
                            _buildInput('Şifre',
                                isPassword: true,
                                controller: _passwordController),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Üye değil misiniz?'),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/signup');
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.brown[600],
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  child: const Text('Üye Ol'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.brown[400],
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: _login,
                                child: const Text('Giriş Yap'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Footerr(children: []),
            ],
          );
        },
      ),
    );
  }
}
