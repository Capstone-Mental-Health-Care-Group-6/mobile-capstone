import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:empathi_care/utils/baseurl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePsikologService {
  ProfilePsikologService();

  final Dio dio = Dio();

  Future<Map<String, dynamic>> getDataDoctor(int idDoctor) async {
    try {
      final pref = await SharedPreferences.getInstance();
      Map<String, String> mainheader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${pref.getString('accesstoken')}",
      };
      final response = await dio.get("${Url.baseUrl}/doctor/$idDoctor",
          options: Options(headers: mainheader));

      final responseBody = response.data['data'];
      log(responseBody.toString());
      return responseBody;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getPatientById(String id) async {
    try {
      final pref = await SharedPreferences.getInstance();
      Map<String, String> mainheader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${pref.getString('accesstoken')}",
      };
      final response = await dio.get("${Url.baseUrl}/$id",
          options: Options(headers: mainheader));

      final responseBody = response.data['data'];

      return responseBody;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
