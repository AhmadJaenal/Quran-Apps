import 'package:al_quran_app/models/prayer_model.dart';

import '../data/doa_harian.dart';

class PrayersController {
  Future<List<PrayerModel>> fetchPrayers() async {
    return prayers.map((json) => PrayerModel.fromJson(json)).toList();
  }
}
