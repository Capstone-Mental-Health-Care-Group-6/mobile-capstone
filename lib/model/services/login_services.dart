import 'package:dio/dio.dart';
import 'package:empathi_care/model/login_model.dart';
import 'package:empathi_care/utils/constant/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  LoginService();
  final Dio _dio = Dio();
  late String message;
  late SharedPreferences fullLoginData;

  Future<Login> login(String email, String password) async {
    fullLoginData = await SharedPreferences.getInstance();
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
      String accesstoken = data['data']['token']['access_token'];
      fullLoginData.setString('accesstoken', accesstoken);
      fullLoginData.setString('password', password);
      return Login.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
