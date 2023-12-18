import 'package:dio/dio.dart';
import 'package:empathi_care/model/change_password_model.dart';
import 'package:empathi_care/utils/constant/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences fullLoginData;
String accesstoken = '';

class ChangePasswordService {
  ChangePasswordService();
  final Dio _dio = Dio();

  Future<ChangePasswordModel> changePassword(String password) async {
    fullLoginData = await SharedPreferences.getInstance();
    accesstoken = fullLoginData.getString('accesstoken').toString();
    Map<String, dynamic> changePasswordData = {"password": password};
    try {
      final response = await _dio.put(
          '${BaseUrl.baseurl}/account/update/password',
          data: changePasswordData,
          options: Options(headers: {"Authorization": 'Bearer $accesstoken'}));

      return ChangePasswordModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}