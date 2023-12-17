import 'package:dio/dio.dart';
import 'package:empathi_care/model/psikolog_model.dart';
import 'package:empathi_care/utils/baseurl.dart';

class PsikologApiService{
  final Dio _dio = Dio();

  Future<Psikolog> fetchPsikolog(String token) async {
    try {
      final response = await _dio.get(
        "${Url.baseUrl}/doctor",
        options: Options(
          headers: {'Authorization':'Bearer $token'}
        )
      );
      
      return Psikolog.fromJson(response.data);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<Psikolog> fetchPsikologSearch(String token,String search) async {
    
    try {
      final response = await _dio.get(
        "${Url.baseUrl}/doctor?name=$search",
        options: Options(
          headers: {'Authorization':'Bearer $token'}
        )
      );
    
      return Psikolog.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}