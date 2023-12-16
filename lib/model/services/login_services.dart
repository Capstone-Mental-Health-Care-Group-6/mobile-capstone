import 'package:dio/dio.dart';
import 'package:empathi_care/model/login_model.dart';
import 'package:empathi_care/utils/constant/url.dart';

class LoginService {
  LoginService();
  final Dio _dio = Dio();
  late String message;

  Future<Login> login(String email, String password) async {
    Map<String, dynamic> loginData = {"email": email, "password": password};
    try {
      final response =
          await _dio.post('${BaseUrl.baseurl}/login', data: loginData);

      Map<String, dynamic> data = response.data;

      // String name = data['data']['name'];
      // String email = data['data']['email'];
      // String accesstoken = data['data']['token']['access_token'];
      // String refreshtoken = data['data']['token']['refresh_token'];
      message = data['message'];

      return Login.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
