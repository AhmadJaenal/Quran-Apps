import 'package:al_quran_app/widgets/card_ayat.dart';
import 'package:flutter/material.dart';

import '../controllers/detail_surah_controller.dart';
import '../shared/theme.dart';

class DetailSurahPage extends StatefulWidget {
  final int id;
  final String surahLatinName;
  final String placeOfRelevation;
  final String meaningOfSurahName;
  final String urlAudioFull;
  final int numberOfVerses;
  const DetailSurahPage({
    super.key,
    required this.id,
    required this.surahLatinName,
    required this.placeOfRelevation,
    required this.meaningOfSurahName,
    required this.urlAudioFull,
    required this.numberOfVerses,
  });

  @override
  State<DetailSurahPage> createState() => _DetailSurahPageState();
}

class _DetailSurahPageState extends State<DetailSurahPage> {
  @override
  bool isList = true;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: Container(),
            backgroundColor: bgColor,
            elevation: 0,
            pinned: true,
            centerTitle: false,
            expandedHeight: 60.0,
            // NOTE:: Appbar code
            flexibleSpace: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Padding(
                padding:
                    EdgeInsetsDirectional.symmetric(horizontal: defaultMargin),
                child: AppBar(
                  backgroundColor: bgColor,
                  elevation: 0,
                  leading: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset('assets/icon_back.png'),
                  ),
                  leadingWidth: 24,
                  title: Text(
                    widget.surahLatinName,
                    style: purpleTextStyle.copyWith(
                        fontSize: 20, fontWeight: bold),
                  ),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isList = !isList;
                        });
                      },
                      child: isList
                          ? Image.asset('assets/icon_list.png',
                              width: 28, color: primaryColor)
                          : Image.asset('assets/icon_quran.png',
                              width: 32, color: primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // NOTE:: End appbar code

          // NOTE:: Header Code
          SliverAppBar(
            leading: Container(),
            backgroundColor: bgColor,
            elevation: 0,
            // pinned: true,
            toolbarHeight: 160,
            title: Column(
              children: [
                Text(
                  widget.surahLatinName,
                  style:
                      whiteTextStyle.copyWith(fontSize: 26, fontWeight: medium),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.meaningOfSurahName,
                  style:
                      whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(145),
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 1,
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    color: whiteColor.withOpacity(.3),
                  ),
                  Text(
                    '${widget.placeOfRelevation} | ${widget.numberOfVerses} Ayat',
                    style: whiteTextStyle.copyWith(
                        fontSize: 26, fontWeight: medium),
                  ),
                  const SizedBox(height: 32),
                  widget.surahLatinName == 'At-Taubah'
                      ? const SizedBox()
                      : Image.asset('assets/image_basmallah.png', height: 48),
                  const SizedBox(height: 50),
                ],
              ),
            ),
            centerTitle: true,
            expandedHeight: 300.0,
            flexibleSpace: Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(defaultMargin),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xffDF98FA), Color(0xff9055FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(10, 20),
                        color: purpleColor.withOpacity(.4),
                        spreadRadius: -12,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRect(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Column(),
                        Transform.translate(
                          offset: const Offset(50, 50),
                          child: Opacity(
                            opacity: .1,
                            child: Image.asset('assets/image_quran.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // NOTE:: End header Code

          // NOTE:: Generate cardAyat & cardAyatFull code
          FutureBuilder(
            future: DetailSurahController(
              id: widget.id,
            ).fetchDetail(),
            builder: (context, snapshot) {
              final surah = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()));
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: surah!.length,
                    (context, index) {
                      return isList
                          ? CardAyat(
                              arabicText: surah[index].arabicText,
                              indonesianText: surah[index].indonesianText,
                              numberOfVerses: surah[index].verseNumber,
                              audio: surah[index].audio,
                            )
                          : CardAyatFull(
                              arabicText: surah[index].arabicText,
                              indonesianText: surah[index].indonesianText,
                              numberOfVerses: surah[index].verseNumber,
                              audio: surah[index].audio,
                            );
                    },
                  ),
                );
              }
            },
          ),
          // NOTE:: End generate cardAyat & cardAyatFull code
        ],
      ),
    );
  }
}
