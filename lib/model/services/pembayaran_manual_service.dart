import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PembayaranManualService {
  PembayaranManualService();

  final dio = Dio();

  Future addTransaction(String file, Map<String, dynamic> params) async {
    try {
      final pref = await SharedPreferences.getInstance();
      Map<String, String> mainheader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${pref.getString('token')}",
      };
      FormData data = FormData.fromMap({
        "price_method": params['price_method'].toString(),
        "price_counseling": params['price_counseling'].toString(),
        "price_duration": params['price_duration'].toString(),
        "payment_proof": await MultipartFile.fromFile(
          file,
          filename: file.toString(),
        ),
        "payment_type": params['payment_type'].toString(),
        "doctor_id": params['doctor_id'].toString(),
      });

      final response = await Dio().post(
        "https://kmb5alta.online/transaksi",
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
