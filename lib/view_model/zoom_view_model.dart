import 'package:dio/dio.dart';
import 'package:empathi_care/model/mystate_model.dart';
import 'package:empathi_care/model/services/zoom_service.dart';
import 'package:empathi_care/model/zoom_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ZoomViewModel extends ChangeNotifier {
  final ZoomService _zoomService = ZoomService();
  ZoomModel? _zoomModel;
  ZoomModel? get zooModel => _zoomModel;

  Future<ZoomModel> getDataFromApi({required int doctorId}) async {
    _zoomModel = await _zoomService.fetchData(id: doctorId);
    try {
      if (_zoomModel != null) {
        debugPrint('aa : $_zoomModel');
        notifyListeners();
        return _zoomModel!;
      } else {
        debugPrint('bb : $_zoomModel');
        throw Exception('Failed to fetch active package');
      }
    } catch (e) {
      throw Exception('Unknown Error Zoom $e');
    }
  }

  String formattedDate(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy').format(dateTime);
  }

  bool _isMeetingOpened = false;
  
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

  bool get isMeetingOpened => _isMeetingOpened;
  bool get isConsultationSession => _isConsultationSession;

  Future<void> openGmeet(String linkGmeet) async {
    Uri link = Uri.parse(linkGmeet);
    if (linkGmeet.isNotEmpty) {
      await launchUrl(link);
      _isMeetingOpened = true;
      notifyListeners();
    } else {
      throw "Couldn't launch Gmeet";
    }
  }

  void startConsultationSession() {
    _isConsultationSession = true;
    notifyListeners();
  }

  void endConsultationSession() {
    _isConsultationSession = false;
    notifyListeners();
  }
}
