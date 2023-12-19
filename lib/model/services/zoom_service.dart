import 'package:dio/dio.dart';
import 'package:empathi_care/model/zoom_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ZoomService {
  final _dio = Dio();
  late SharedPreferences authUser;
  late String accessToken;
  final baseUrl = "https://kmb5alta.online";

  Future<ZoomModel> fetchData({required int id}) async {
    try {
      authUser = await SharedPreferences.getInstance();
      accessToken = authUser.getString('accesstoken').toString();

      final response = await _dio.get(
        '$baseUrl/counseling/$id',
        options: Options(
          headers: {
            "Authorization": 'Bearer $accessToken',
          },
        ),
      );
      debugPrint('$response');
      return ZoomModel.fromJson(response.data);
    } catch (e) {
      throw Exception('gaga fetch data $e');
    }
  }
}
