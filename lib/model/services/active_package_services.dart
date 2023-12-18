import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:empathi_care/model/active_package_models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JwtService {
  Map<String, dynamic> decodeToken(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }

    final payload = parts[1];
    final String decoded =
        utf8.decode(base64Url.decode(base64Url.normalize(payload)));
    return json.decode(decoded);
  }

  int getTokenId(String token) {
    final Map<String, dynamic> decodedToken = decodeToken(token);
    return decodedToken['id'];
  }
}

class UrlBulService {
  final domainUrl = "https://kmb5alta.online";
  String buildUrl(int userId) {
    // ignore: unnecessary_null_comparison
    if (userId == null) {
      throw Exception("Couldn't extract user ID from token");
    }
    return '$domainUrl/counseling/user/2';
  }
}

class ActivePackageService {
  final Dio _dio;
  late SharedPreferences sp;
  String token = '';
  ActivePackageService(this._dio);

  Future fetchData() async {
    sp = await SharedPreferences.getInstance();
    token = sp.getString('accesstoken').toString();
    try {
      final JwtService jwtService = JwtService();
      final int userId = jwtService.getTokenId(token);
      final UrlBulService urlBulService = UrlBulService();
      final String url = urlBulService.buildUrl(userId);

      final response = await _dio.get(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      debugPrint('$response');
      final activePackage = ActivePackageModel.fromJson(response.data);
      debugPrint('$activePackage');
      return activePackage;
    } catch (e) {
      rethrow;
    }
  }
}
