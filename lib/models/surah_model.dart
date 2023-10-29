class Surah {
  final int id;
  final String surahName;
  final String surahLatinName;
  final String placeOfRelevation;
  final String meaningOfSurahName;
  final String description;
  final String audioFull;
  final int numberOfVerses;

  Surah({
    required this.id,
    required this.surahName,
    required this.surahLatinName,
    required this.placeOfRelevation,
    required this.meaningOfSurahName,
    required this.description,
    required this.audioFull,
    required this.numberOfVerses,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      id: json['nomor'],
      surahName: json['nama'],
      surahLatinName: json['namaLatin'],
      placeOfRelevation: json['tempatTurun'],
      meaningOfSurahName: json['arti'],
      description: json['deskripsi'],
      audioFull: json['audioFull']['05'],
      numberOfVerses: json['jumlahAyat'],
    );
  }
}
