import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constant/url.dart';

class GetAllPatientService {
  final Dio _dio = Dio();
  late SharedPreferences fullPatientData;
  String email = '';
  String accesstoken = '';
  int? userId;

  Future getAllPatient(String token) async {
    fullPatientData = await SharedPreferences.getInstance();
    email = fullPatientData.getString('email').toString();
    try {
      final responseToGetId = await _dio.get(BaseUrl.baseurl,
          options: Options(headers: {"Authorization": 'Bearer $token'}));
      if (responseToGetId.statusCode == 200) {
        List<dynamic> users = responseToGetId.data['data'];

        for (var user in users) {
          if (user['email'] == email) {
            userId = user['ID'];
            return userId;
          }
        }
      }
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future isTokenValid(String token) async {
    fullPatientData = await SharedPreferences.getInstance();
    try {
      final response = await _dio.get(BaseUrl.baseurl,
          options: Options(headers: {"Authorization": 'Bearer $token'}));
      if (response.statusCode == 200) {
        return false;
      }
    } on DioException catch (_) {
      fullPatientData.remove('accesstoken');
      fullPatientData.remove('email');
      fullPatientData.remove('password');
      return true;
    }
  }
}
