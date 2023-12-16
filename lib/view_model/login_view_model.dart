import 'package:dio/dio.dart';
import 'package:empathi_care/model/login_model.dart';
import 'package:empathi_care/model/mystate_model.dart';
import 'package:empathi_care/model/services/login_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  LoginService loginService = LoginService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  Login? login;
  MyState myState = MyState.initial;
  late String message;
  late SharedPreferences loginData;

  Future loginAuth() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      login = await loginService.login(
          emailController.text, passwordController.text);
      myState = MyState.loaded;
      message = loginService.message;

      notifyListeners();
    } catch (e) {
      if (e is DioException) {
        myState = MyState.failed;
        notifyListeners();
        rethrow;
      }
      myState = MyState.failed;
      notifyListeners();
    }
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    notifyListeners();
  }
}
