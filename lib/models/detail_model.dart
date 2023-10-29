class DetailSurahModel {
  final int verseNumber;
  final String arabicText;
  final String indonesianText;
  final String audio;

  DetailSurahModel({
    required this.verseNumber,
    required this.arabicText,
    required this.indonesianText,
    required this.audio,
  });

  factory DetailSurahModel.fromJson(Map<String, dynamic> json) {
    return DetailSurahModel(
      verseNumber: json['nomorAyat'],
      arabicText: json['teksArab'],
      indonesianText: json['teksIndonesia'],
      audio: json['audio']['05'],
    );
  }
}
