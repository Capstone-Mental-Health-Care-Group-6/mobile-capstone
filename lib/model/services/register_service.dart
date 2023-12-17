import 'package:dio/dio.dart';
import 'package:empathi_care/model/register_model.dart';
import 'package:empathi_care/utils/constant/url.dart';

class RegisterService {
  final Dio _dio = Dio();

  Future<Register> register(String name, String email, String password,
      String birthDate, String gender, String phone) async {
    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "email": email,
        "password": password,
        "date_of_birth": birthDate,
        "gender": gender,
        "phone_number": phone,
      });

      final response =
          await _dio.post('${BaseUrl.baseurl}/register', data: formData);

      return Register.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
