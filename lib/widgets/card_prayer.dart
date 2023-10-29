import 'package:flutter/material.dart';

import '../shared/theme.dart';

class CardPrayer extends StatelessWidget {
  final String prayerName;
  final String indonesianText;
  final String arabicText;
  const CardPrayer({
    super.key,
    required this.prayerName,
    required this.indonesianText,
    required this.arabicText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: purpleColor.withOpacity(.3), width: 2),
      ),
      child: Column(
        children: [
          Text(
            prayerName,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            arabicText,
            style: ayatTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 8),
          Text(
            '" $indonesianText "',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
