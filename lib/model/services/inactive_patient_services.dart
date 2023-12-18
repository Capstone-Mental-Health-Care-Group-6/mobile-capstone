import 'package:dio/dio.dart';
import 'package:empathi_care/model/inactive_patient_model.dart';
import 'package:empathi_care/utils/constant/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InactivePatientService {
  late SharedPreferences sp;
  final Dio _dio = Dio();
  String token = '';

  Future<InactivePatientModel> inactivePatient() async {
    sp = await SharedPreferences.getInstance();

    token = sp.getString('accesstoken').toString();

    try {
      final response = await _dio.post('${BaseUrl.baseurl}/inactivate',
          options: Options(headers: {"Authorization": 'Bearer $token'}));

      return InactivePatientModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
