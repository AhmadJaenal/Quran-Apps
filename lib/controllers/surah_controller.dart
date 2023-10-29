import 'package:al_quran_app/models/surah_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SurahController {
  final String apiUrl = 'http://equran.id/api/v2/surat';

  Future<List<Surah>> fetchSurah() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> surahs = data['data'];
        return surahs.map((json) => Surah.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load surah');
      }
    } catch (e) {
      print("result Error $e");
      throw e;
    }
  }
}
