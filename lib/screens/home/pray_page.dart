import 'package:al_quran_app/controllers/prayer_controller.dart';
import 'package:al_quran_app/shared/theme.dart';
import 'package:al_quran_app/widgets/card_prayer.dart';
import 'package:flutter/material.dart';

class PrayPage extends StatelessWidget {
  const PrayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        // NOTE:: Content code
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              leading: Container(),
              backgroundColor: bgColor,
              expandedHeight: 180,
              flexibleSpace: Padding(
                padding: EdgeInsets.all(defaultMargin),
                child: Image.asset('assets/image_prayer.png'),
              ),
              pinned: false,
            ),
            // NOTE:: Generate cardPrayer code
            FutureBuilder(
              future: PrayersController().fetchPrayers(),
              builder: (context, snapshot) {
                final prayer = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()));
                } else {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: prayer!.length,
                      (context, index) {
                        return CardPrayer(
                          prayerName: prayer[index].prayerName,
                          indonesianText: prayer[index].indonesianText,
                          arabicText: prayer[index].arabicText,
                        );
                      },
                    ),
                  );
                }
              },
            ),
            // NOTE:: End generate cardPrayer code
          ],
        ),
      ),
      // NOTE:: End content code
    );
  }
}
