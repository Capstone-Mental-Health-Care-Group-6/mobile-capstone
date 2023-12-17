import 'package:flutter/material.dart';

class FillingProvider extends ChangeNotifier {
  List<bool> itemStatus = List.generate(2, (index) => false);

  void item(int index) {
    for (int i = 0; i < itemStatus.length; i++) {
      itemStatus[i] = i == index;
    }
    notifyListeners();
  }
}
