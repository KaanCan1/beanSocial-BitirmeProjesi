import 'package:beansocial/database_service.dart';
import 'package:beansocial/footerr.dart';
import 'package:beansocial/giris_kontrol.dart';
import 'package:beansocial/header.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DatabaseService _databaseService = DatabaseService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    final user = await _databaseService.getUserByEmail(email);

    if (user != null && user['password'] == password) {
      await AuthService.login();
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
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Header(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 400, left: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/animasyon.json',
                    height: 200,
                    repeat: true,
                  ),
                  const SizedBox(height: 20),
                  _buildInput('Email', controller: _emailController),
                  const SizedBox(height: 16),
                  _buildInput('Şifre',
                      isPassword: true, controller: _passwordController),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Giriş Yap',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text('Hesabınız yok mu? Kayıt olun'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Footerr(children: []),
          ],
        ),
      ),
    );
  }
}
