import 'package:al_quran_app/screens/detail_surah_page.dart';
import 'package:flutter/material.dart';

import '../shared/theme.dart';

class CardSurah extends StatelessWidget {
  final int id;
  final String surahName;
  final String surahLatinName;
  final String meaningOfSurahName;
  final String placeOfRelevation;
  final String urlAudioFull;
  final int numberOfVerses;
  final int indexSurah;
  const CardSurah({
    super.key,
    required this.id,
    required this.surahName,
    required this.surahLatinName,
    required this.meaningOfSurahName,
    required this.placeOfRelevation,
    required this.urlAudioFull,
    required this.numberOfVerses,
    required this.indexSurah,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailSurahPage(
                    urlAudioFull: urlAudioFull,
                    id: id,
                    surahLatinName: surahLatinName,
                    meaningOfSurahName: meaningOfSurahName,
                    numberOfVerses: numberOfVerses,
                    placeOfRelevation: placeOfRelevation,
                  );
                },
              ),
            );
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      indexSurah.toString(),
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    Image.asset('assets/icon_muslim.png', width: 36),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      surahLatinName,
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '$placeOfRelevation | $numberOfVerses Ayat',
                      style: secondaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  surahName,
                  style: secondaryTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 20,
                    color: purpleColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
          color: secondaryColor.withOpacity(.2),
        ),
      ],
    );
  }
}
