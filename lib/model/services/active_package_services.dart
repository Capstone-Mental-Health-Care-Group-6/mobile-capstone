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
    // ignore: unnecessary_null_comparison
    if (decodedToken != null && decodedToken['id'] != null) {
      return decodedToken['id'];
    } else {
      throw Exception("Couldn't extract user ID from token");
    }
  }
}

class UrlBulService {
  final domainUrl = "https://kmb5alta.online";
  String buildUrl(int id) {
    // ignore: unnecessary_null_comparison
    if (id == null) {
      throw Exception("Couldn't extract user ID from token");
    }
    debugPrint('$id');
    return '$domainUrl/counseling/user/$id';
  }
}

class ActivePackageService {
  late SharedPreferences sp;
  final Dio _dio = Dio();
  String token = '';

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

      final ActivePackageModel activePackage =
          ActivePackageModel.fromJson(response.data);

      debugPrint('$activePackage');

      return activePackage;
    } catch (e) {
      rethrow;
    }
  }
}
