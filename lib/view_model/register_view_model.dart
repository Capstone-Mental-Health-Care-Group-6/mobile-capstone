import 'package:dio/dio.dart';
import 'package:empathi_care/model/register_model.dart';
import 'package:empathi_care/model/services/register_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterService registerService = RegisterService();
  late String name, email, password, gender, phone;
  late DateTime birthDate;
  Register? register;
  late String dateFix;

  Future registerAuth() async {
    dateFix = DateFormat('yyyy-MM-dd').format(birthDate);

    try {
      register = await registerService.register(
          name, email, password, dateFix, gender, phone);
      notifyListeners();
    } catch (e) {
      if (e is DioException) {
        rethrow;
      }
    }
  }

}
