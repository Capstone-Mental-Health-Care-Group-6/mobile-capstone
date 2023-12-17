import 'package:dio/dio.dart';
import 'package:empathi_care/model/konseling_model.dart';
import 'package:empathi_care/utils/baseurl.dart';

class KonsellingApiService {
  final Dio _dio = Dio();

  Future<KonselingData> fetchTopik(String token) async {
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

  Future<KonselingData> fetchTopikById(String token, id) async {
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
