import 'package:empathi_care/view/widget/card_all_counseling_widget.dart';
import 'package:flutter/material.dart';

class InstantCounselingProvider extends ChangeNotifier {
  final List<String> textFilter = [
    "Semua",
    "Aktif",
    "Selesai",
  ];
  int _selectIndex = 0;
  int get selectIndex => _selectIndex;
  final screenCounselingInstant = [
    CardAllWidgetInstant(),
    Container(),
    Container(),
  ];

  void selectIndexInstant(int index) {
    _selectIndex = index;
    notifyListeners();
  }
}
