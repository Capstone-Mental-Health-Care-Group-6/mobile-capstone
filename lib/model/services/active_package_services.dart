import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:empathi_care/model/active_package_model.dart';
import 'package:flutter/material.dart';

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
    if(userId == null ){
      throw Exception("Couldn't extract user ID from token");
    }
    return '$domainUrl/counseling/user/2';
  }
}

class ActivePackageService {
  final Dio _dio;
  ActivePackageService(this._dio);

  Future fetchData(String token) async {
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
