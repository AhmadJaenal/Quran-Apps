import 'package:al_quran_app/models/detail_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailSurahController {
  final int id;
  DetailSurahController({required this.id});

  Future<List<DetailSurahModel>> fetchDetail() async {
    final String apiUrl = 'http://equran.id/api/v2/surat/$id';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> surah = data['data']['ayat'];

        return surah.map((json) => DetailSurahModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load surah');
      }
    } catch (e) {
      print("result Error : $e");
      throw e;
    }
  }
}
