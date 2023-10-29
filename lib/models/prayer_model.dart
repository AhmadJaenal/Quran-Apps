class PrayerModel {
  final String prayerName;
  final String arabicText;
  final String indonesianText;

  PrayerModel({
    required this.prayerName,
    required this.arabicText,
    required this.indonesianText,
  });

  factory PrayerModel.fromJson(Map<String, dynamic> json) {
    return PrayerModel(
      prayerName: json['doa'],
      arabicText: json['arab'],
      indonesianText: json['id'],
    );
  }
}
