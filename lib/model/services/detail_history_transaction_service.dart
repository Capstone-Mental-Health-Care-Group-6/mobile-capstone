import 'package:dio/dio.dart';
import 'package:empathi_care/model/detail_history_transaction_model.dart';
import 'package:empathi_care/utils/baseurl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailHistoryTransactionService {
  final Dio _dio = Dio();
  late SharedPreferences authUser;
  late String accessToken;

  Future<DetailHistoryTransactionModel> fetchDetailHistoryTransactionById(
      {required String transactionId}) async {
    try {

      authUser = await SharedPreferences.getInstance();
      accessToken = authUser.getString('accesstoken').toString();

      final response = await _dio.get('${Url.baseUrl}/transaksi/check/$transactionId',
          options: Options(headers: {"Authorization": 'Bearer $accessToken'}));

      return DetailHistoryTransactionModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
