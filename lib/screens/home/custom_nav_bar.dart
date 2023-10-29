import 'package:al_quran_app/shared/theme.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'pray_page.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int currentIndex = 0;

  Widget page() {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const PrayPage();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // NOTE:: Bottom nav bar code
      body: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: secondaryColor.withOpacity(.05),
              blurRadius: 25,
              spreadRadius: 10,
              offset: const Offset(0, -5),
            ),
          ]),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30),
            ),
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 12,
              clipBehavior: Clip.antiAlias,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: bgColor,
                currentIndex: currentIndex,
                onTap: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_quran_menu.png',
                        width: 32,
                        color:
                            currentIndex == 0 ? primaryColor : secondaryColor,
                      ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_praying.png',
                        width: 32,
                        color:
                            currentIndex == 2 ? primaryColor : secondaryColor,
                      ),
                    ),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
        ),
        body: page(),
      ),
      // NOTE:: End bottom nav bar code
    );
  }
}
