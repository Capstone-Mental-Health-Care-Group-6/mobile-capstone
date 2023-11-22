import 'package:flutter/material.dart';

class LogRegProvider extends ChangeNotifier {
  bool visiblePassword = true;
  bool visiblePassword2 = true;
  bool? check = false;

  void changeVisible() {
    visiblePassword = !visiblePassword;
    notifyListeners();
  }

  void changeVisible2() {
    visiblePassword2 = !visiblePassword2;
    notifyListeners();
  }

  void changeCheck(bool? value) {
    check = value;
    notifyListeners();
  }
}
