import 'package:dio/dio.dart';
import 'package:empathi_care/model/forgot_password_model.dart';
import 'package:empathi_care/model/services/forgot_password_service.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewModel with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final ForgotPasswordService forgotPasswordService = ForgotPasswordService();

  TextEditingController emailController = TextEditingController();
  ForgotPasswordModel? message;

  Future sendEmailConfirmation({
    required String email,
  }) async {
    try {
      message = await forgotPasswordService.sendEmailConfirmation(email: email);
      notifyListeners();
    } on DioException catch (_) {
      rethrow;
    }
  }

  // Future emailVerificationWithOtp({
  //   required String otp,
  // }) async {
  //   try {
  //     message = forgotPasswordService.emailVerificationWithOtp(otp: otp);
  //     // debugPrint('<= message $message');
  //     notifyListeners();
  //   } catch (e) {
  //     // debugPrint('<= message error $e');

  //     rethrow;
  //   }
  // }
}
