import 'dart:convert';
import 'package:empathi_care/utils/baseurl.dart';
import 'package:dio/dio.dart';
import 'package:empathi_care/model/riwayat_transaksi_model.dart';

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

class UrlBuilderService {
  String buildUrl(int id) {
    return '${Url.baseUrl}/transaksi/patient/$id';
  }
}

class RiwayatTransaksiServices {
  final Dio _dio;

  RiwayatTransaksiServices(this._dio);

  Future fetchRiwayatTransaksi(String token) async {
    try {
      final JwtService jwtService = JwtService();
      final int id = jwtService.getTokenId(token);

      final UrlBuilderService urlBuilderService = UrlBuilderService();
      final String url = urlBuilderService.buildUrl(id);

      final response = await _dio.get(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      final RiwayatTransaksi data = RiwayatTransaksi.fromJson(response.data);

      return data;
    } catch (e) {
      throw Exception('Gagal mengambil data dari API: $e');
    }
  }
}
