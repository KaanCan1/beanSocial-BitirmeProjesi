import 'package:beansocial/anaSayfa.dart';
import 'package:beansocial/anketSayfa.dart';
import 'package:beansocial/hakkimizda.dart';
import 'package:beansocial/kahveler.dart';
import 'package:beansocial/login.dart';
import 'package:beansocial/signup.dart';
import 'package:beansocial/sss.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/url_strategy.dart'; // ✅ BUNU EKLE

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BeanSocial",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: Colors.white),
        listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const AnaSayfa(), // Ana sayfa olarak AnaSayfa widget'ı
      routes: {
        '/sss': (context) => const SSS(),
        //'/custom_anket': (context) => const CustomListItemApp(),
        '/AnaSayfa': (context) => const AnaSayfa(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/hakkimizda': (context) => const Hakkimizda(),
        '/kahveler': (context) => const Kahveler(),
        '/anketSayfa': (context) => const CoffeeSurveyPage(),

        //'/profile': (context) => const Profile(),
      },
    );
  }
}
