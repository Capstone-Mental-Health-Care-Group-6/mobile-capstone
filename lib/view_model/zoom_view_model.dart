import 'package:empathi_care/model/services/zoom_service.dart';
import 'package:empathi_care/model/zoom_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ZoomViewModel extends ChangeNotifier {
  final ZoomService _zoomService = ZoomService();
  ZoomModel? _zoomModel;
  ZoomModel? get zooModel => _zoomModel;

  Future<ZoomModel> getDataFromApi(doctorId) async {
    _zoomModel = await _zoomService.fetchData(doctorId);
    try {
      if (_zoomModel != null) {
        debugPrint('aa : $_zoomModel');
        notifyListeners();
        return _zoomModel!;
      } else {
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
