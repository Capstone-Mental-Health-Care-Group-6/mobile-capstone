import 'package:dio/dio.dart';
import 'package:empathi_care/model/midtrans_transaction_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionService {
  late SharedPreferences sp;
  final Dio _dio = Dio();
  final String baseUrl = 'https://kmb5alta.online';
  late SharedPreferences authUser;
  late String accessToken;

  Future<MidtransTransactionModel> makeMidtransTransaction(
      {required int topicId,
      required int patientId,
      required int methodId,
      required int durationId,
      required int counselingId,
      required int counselingSession,
      required String counselingType,
      required int priceMethod,
      required int priceCounseling,
      required int priceDuration,
      required String paymentType,
      required int doctorId}) async {
    try {
      authUser = await SharedPreferences.getInstance();
      accessToken = authUser.getString('accesstoken').toString();

      final Response response = await _dio.post('$baseUrl/transaksi',
          data: {
            'topic_id': topicId,
            'patient_id': patientId,
            'method_id': methodId,
            'duration_id': durationId,
            'counseling_id': counselingId,
            'counseling_session': counselingSession,
            'counseling_type': counselingType,
            'price_method': priceMethod,
            'price_counseling': priceCounseling,
            'price_duration': priceDuration,
            'payment_type': paymentType,
            'doctor_id': doctorId
          },
          options: Options(
            headers: {"Authorization": "Bearer $accessToken"},
          ));

      return MidtransTransactionModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
