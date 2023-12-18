import 'package:dio/dio.dart';
import 'package:empathi_care/model/mystate_model.dart';
import 'package:empathi_care/model/services/zoom_service.dart';
import 'package:empathi_care/model/zoom_model.dart';
import 'package:flutter/material.dart';

class ZoomViewModel extends ChangeNotifier {
  ZoomService zoomService = ZoomService();
  ZoomModel? zoomModel;
  MyState myState = MyState.initial;

  Future<ZoomModel> getDataFromApi({required int id}) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      zoomModel = await zoomService.fetchData(id: id);
      myState = MyState.loaded;
      notifyListeners();
      return zoomModel!;
    } catch (e) {
      if (e is DioException) {
        myState = MyState.failed;
        notifyListeners();
        rethrow;
      }
      myState = MyState.failed;
      notifyListeners();
      throw Exception('Unknown Error');
    }
  }

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
