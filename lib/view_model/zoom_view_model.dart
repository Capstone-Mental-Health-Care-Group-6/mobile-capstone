import 'package:flutter/material.dart';

class ZoomViewModel extends ChangeNotifier {
  bool _isConsultationSession = false;

  bool get isConsultationSession => _isConsultationSession;

  void startConsultationSession() {
    _isConsultationSession = true;
    notifyListeners();
  }

  void endConsultationSession() {
    _isConsultationSession = false;
    notifyListeners();
  }
}
