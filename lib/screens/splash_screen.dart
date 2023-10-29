import 'package:al_quran_app/shared/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // NOTE:: Splash screen code
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quran App',
                style: purpleTextStyle.copyWith(
                  fontSize: 28,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Learn Quran and\nRecite once everyday',
                textAlign: TextAlign.center,
                style: secondaryTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 56),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset('assets/image_landing_page.png'),
              ),
              Transform.translate(
                offset: const Offset(0, -30),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/nav-bar');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(bronwColor),
                    elevation: MaterialStateProperty.all(0.2),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // NOTE:: End splash screen code
    );
  }
}
