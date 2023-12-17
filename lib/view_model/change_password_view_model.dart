import 'package:dio/dio.dart';
import 'package:empathi_care/model/change_password_model.dart';
import 'package:empathi_care/model/services/change_password_services.dart';
import 'package:flutter/foundation.dart';

class ChangePasswordViewModel extends ChangeNotifier {
  ChangePasswordService changePasswordService = ChangePasswordService();
  ChangePasswordModel? changePasswordModel;

  Future changePassword(String password) async {
    try {
      changePasswordModel =
          await changePasswordService.changePassword(password);

      notifyListeners();
    } catch (e) {
      if (e is DioException) {
        rethrow;
      }
    }
  }
}
