import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:empathi_care/utils/baseurl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PembayaranManualService {
  PembayaranManualService();

  final dio = Dio();

  Future addTransaction(String file, Map<String, dynamic> params) async {
    try {
      final pref = await SharedPreferences.getInstance();
      Map<String, String> mainheader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${pref.getString('accesstoken')}",
      };
      FormData data = FormData.fromMap({
        "price_method": params['price_method'].toString(),
        "price_counseling": params['price_counseling'].toString(),
        "price_duration": params['price_duration'].toString(),
        "payment_type": params['payment_type'].toString(),
        "doctor_id": params['doctor_id'].toString(),
        "topic_id": params['topic_id'].toString(),
        "patient_id": params['patient_id'].toString(),
        "method_id": params['method_id'].toString(),
        "duration_id": params['duration_id'].toString(),
        "counseling_id": params['counseling_id'].toString(),
        "counseling_session": params['counseling_session'].toString(),
        "counseling_type": params['counseling_type'].toString(),
        "payment_proof": await MultipartFile.fromFile(
          file,
          filename: file.toString(),
        ),
      });
      log(data.toString());
      final response = await dio.post(
        "${Url.baseUrl}/transaksi",
        data: data,
        options: Options(headers: mainheader),
      );

      final responseBody = response.data['data'];

      return responseBody;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
