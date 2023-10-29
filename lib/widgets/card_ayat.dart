import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';

import '../shared/theme.dart';

class CardAyat extends StatefulWidget {
  final int numberOfVerses;
  final String indonesianText;
  final String arabicText;
  final String audio;
  const CardAyat({
    super.key,
    required this.numberOfVerses,
    required this.indonesianText,
    required this.arabicText,
    required this.audio,
  });

  @override
  State<CardAyat> createState() => _CardAyatState();
}

class _CardAyatState extends State<CardAyat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: secondaryColor.withOpacity(.1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    widget.numberOfVerses.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  Image.asset('assets/icon_muslim.png', width: 36),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.arabicText,
                  style: ayatTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.indonesianText,
                  style: primaryTextStyle.copyWith(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
          color: secondaryColor.withOpacity(.3),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class CardAyatFull extends StatelessWidget {
  final int numberOfVerses;
  final String indonesianText;
  final String arabicText;
  final String audio;
  const CardAyatFull({
    super.key,
    required this.numberOfVerses,
    required this.indonesianText,
    required this.arabicText,
    required this.audio,
  });

  @override
  Widget build(BuildContext context) {
    ArabicNumbers arabicNumber = ArabicNumbers();
    String ayat = arabicNumber.convert(numberOfVerses);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Text(
                ayat.toString(),
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              Image.asset('assets/icon_muslim.png', width: 36),
            ],
          ),
          Expanded(
            child: Text(
              arabicText,
              style: ayatTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
