import 'package:dio/dio.dart';
import 'package:empathi_care/model/konseling_model.dart';
import 'package:empathi_care/utils/baseurl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KonsellingApiService {
  late SharedPreferences sp;
  final Dio _dio = Dio();
  String token = '';

  Future<KonselingData> fetchTopik() async {
    sp = await SharedPreferences.getInstance();

    token = sp.getString('accesstoken').toString();
    try {
      final response = await _dio.get(
        "${Url.baseUrl}/counseling/topics",
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final Map<String, dynamic> responseData = response.data;
      KonselingData data = KonselingData.fromJson(responseData);

      return data;
    } catch (e) {
      throw Exception('Gagal mengambil data dari API: $e');
    }
  }

  Future<KonselingData> fetchTopikById(id) async {
    sp = await SharedPreferences.getInstance();

    token = sp.getString('accesstoken').toString();
    try {
      final response = await _dio.get(
        "${Url.baseUrl}/counseling/topics/$id",
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final Map<String, dynamic> responseData = response.data;
      KonselingData data = KonselingData.fromJson(responseData);

      return data;
    } catch (e) {
      throw Exception('Gagal mengambil data dari API: $e');
    }
  }
}
