import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePsikologService {
  ProfilePsikologService();

  final Dio dio = Dio();

  Future<Map<String, dynamic>> getDataDoctor(String idDoctor) async {
    try {
      final pref = await SharedPreferences.getInstance();
      Map<String, String> mainheader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${pref.getString('token')}",
      };
      final response = await dio.get("https://kmb5alta.online/doctor/$idDoctor", options: Options(headers: mainheader));

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
        "Authorization": "Bearer ${pref.getString('token')}",
      };
      final response = await dio.get("https://kmb5alta.online/patient/account/$id", options: Options(headers: mainheader));

      final responseBody = response.data['data'];

      return responseBody;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
