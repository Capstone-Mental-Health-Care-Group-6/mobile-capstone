import 'package:dio/dio.dart';
import 'package:empathi_care/model/login_model.dart';
import 'package:empathi_care/model/services/login_services.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  LoginService loginService = LoginService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  Login? login;

  Future loginAuth() async {
    try {
      login = await loginService.login(
          emailController.text, passwordController.text);
      notifyListeners();
    } catch (e) {
      if (e is DioException) {
        rethrow;
      }
    }
  }
}
