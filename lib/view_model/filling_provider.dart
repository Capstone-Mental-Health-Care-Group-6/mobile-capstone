import 'package:flutter/material.dart';

class FillingProvider extends ChangeNotifier {
  List<bool> itemStatus = List.generate(2, (index) => false);

  void initialGender(String gender) {
    if (gender == 'Laki-laki') {
      itemStatus = List.generate(2, (index) => index == 0);
      notifyListeners();
    } else if (gender == 'Perempuan') {
      itemStatus = List.generate(2, (index) => index == 1);
      notifyListeners();
    }
  }

  void item(int index) {
    for (int i = 0; i < itemStatus.length; i++) {
      itemStatus[i] = i == index;
    }
    notifyListeners();
  }
}
