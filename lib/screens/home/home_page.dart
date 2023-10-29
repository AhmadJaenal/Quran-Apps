import 'package:al_quran_app/controllers/surah_controller.dart';
import 'package:al_quran_app/shared/theme.dart';
import 'package:al_quran_app/widgets/card_surah.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        // NOTE:: Appbar code
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: defaultMargin),
            child: AppBar(
              backgroundColor: bgColor,
              elevation: 0,
              leading: Image.asset('assets/icon_toggle_menu.png'),
              leadingWidth: 24,
              title: Text(
                'Quran App',
                style: purpleTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
            ),
          ),
        ),
        // NOTE:: End appbar code

        // NOTE:: Header & content code
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Asslamualaikum',
                    style: secondaryTextStyle.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(defaultMargin),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 20),
                  width: double.infinity,
                  height: 131,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xffDF98FA), Color(0xff9055FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/icon_last_read.png',
                                  width: 20),
                              const SizedBox(width: 8),
                              Text(
                                '114 Surah',
                                style: whiteTextStyle,
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Al-Fatihah',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                      Transform.translate(
                        offset: const Offset(50, 25),
                        child: ClipRect(
                          child:
                              Image.asset('assets/image_quran.png', width: 206),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    children: [
                      Text(
                        'Surat',
                        style: purpleTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: 80,
                        height: 3,
                        color: darkPurpleColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // NOTE:: Generate cardSurah code

                SizedBox(
                  width: double.infinity,
                  height: height * .40,
                  child: FutureBuilder(
                    future: SurahController().fetchSurah(),
                    builder: (context, snapshot) {
                      final surahs = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: surahs!.length,
                          itemBuilder: (context, index) {
                            return CardSurah(
                              surahName: surahs[index].surahName,
                              surahLatinName: surahs[index].surahLatinName,
                              placeOfRelevation:
                                  surahs[index].placeOfRelevation,
                              urlAudioFull: surahs[index].audioFull,
                              numberOfVerses: surahs[index].numberOfVerses,
                              indexSurah: index + 1,
                              id: surahs[index].id,
                              meaningOfSurahName:
                                  surahs[index].meaningOfSurahName,
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
                // NOTE:: End generate cardSurah code
              ],
            ),
          ],
        ),
      ),
      // NOTE:: End header & content code
    );
  }
}
