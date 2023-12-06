import 'package:flutter/material.dart';

class EnabledButton extends ChangeNotifier {
  bool isNull = false;
  final passwordLama = TextEditingController();
  final passwordBaru = TextEditingController();

  void enable() {
    isNull = passwordBaru.text.isNotEmpty && passwordLama.text.isNotEmpty;
    notifyListeners();
  }
}
