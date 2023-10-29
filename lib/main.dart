import 'package:al_quran_app/screens/home/custom_nav_bar.dart';
import 'package:al_quran_app/screens/home/home_page.dart';
import 'package:al_quran_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/home-page': (context) => HomePage(),
        '/nav-bar': (context) => const CustomNavBar(),
      },
    );
  }
}
