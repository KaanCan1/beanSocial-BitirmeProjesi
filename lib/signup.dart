import 'package:beansocial/footerr.dart';
import 'package:beansocial/header.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F3),
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
                      constraints: const BoxConstraints(
                        maxWidth: 600,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.08,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Lottie.asset(
                              'assets/animasyon.json',
                              height: height * 0.15,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Kayıt Ol',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w600,
                                color: Colors.brown[700],
                              ),
                            ),
                            const SizedBox(height: 24),
                            _buildInput('Ad - Soyad'),
                            const SizedBox(height: 16),
                            _buildInput('Email'),
                            const SizedBox(height: 16),
                            _buildInput('Şifre', isPassword: true),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.brown[400],
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text('Kayıt Ol'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 56),
              const Footerr(children: []),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInput(String label, {bool isPassword = false}) {
    return TextField(
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
}
