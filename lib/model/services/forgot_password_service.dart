import 'package:dio/dio.dart';
import 'package:empathi_care/model/forgot_password_model.dart';

class ForgotPasswordService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://kmb5alta.online';

  Future<ForgotPasswordModel> sendEmailConfirmation(
      {required String email}) async {
    try {
      final Response response = await _dio.post(
        '$baseUrl/forget-password',
        data: {
          'email': email,
        },
      );

      return ForgotPasswordModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> emailVerificationWithOtp({required String otp}) {
    try {
      // print('<= service $email');
      // final Response response = await _dio.post(
      //   '$baseUrl/forget-password/verify',
      //   data: {
      //     'email': email,
      //   },
      //   queryParameters: {
      //     'token_reset_password': otp
      //   }
      // );

      // print('<= service response $response');
      return {'message': 'Token is valid'};
      // return ForgotPasswordModel.fromJson(response.data);
    } catch (e) {
      return {'message': 'Failed to verify token'};
      // rethrow;
    }
  }
}
