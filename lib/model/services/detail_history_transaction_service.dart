import 'package:dio/dio.dart';
import 'package:empathi_care/model/detail_history_transaction_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailHistoryTransactionService {
  final Dio _dio = Dio();
  late SharedPreferences authUser;
  late String accessToken;

  Future<DetailHistoryTransactionModel> fetchDetailHistoryTransactionById(
      String transactionId) async {
    try {
      const String baseUrl = 'https://kmb5alta.online';

      authUser = await SharedPreferences.getInstance();
      accessToken = authUser.getString('accesstoken').toString();

      final response = await _dio.get('$baseUrl/transaksi/check/$transactionId',
          options: Options(headers: {"Authorization": 'Bearer $accessToken'}));

      return DetailHistoryTransactionModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
