import 'package:dio/dio.dart';
import 'package:empathi_care/model/psikolog_model.dart';
import 'package:empathi_care/utils/baseurl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PsikologApiService {
  late SharedPreferences sp;
  final Dio _dio = Dio();
  String token = '';

  Future<PsikologModel> fetchPsikolog(String token) async {
    try {
      final response = await _dio.get("${Url.baseUrl}/doctor",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return PsikologModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<PsikologModel> fetchPsikologSearch(String search,String token) async {
    // sp = await SharedPreferences.getInstance();

    // token = sp.getString('accesstoken').toString();
    try {
      final response = await _dio.get("${Url.baseUrl}/doctor?name=$search",
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      return PsikologModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
