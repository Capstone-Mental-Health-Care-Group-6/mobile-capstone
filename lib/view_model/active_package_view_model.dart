import 'package:dio/dio.dart';
import 'package:empathi_care/model/active_package_models.dart';
import 'package:empathi_care/model/services/active_package_services.dart';
import 'package:flutter/material.dart';

class ActivePackageViewModel extends ChangeNotifier {
  final ActivePackageService _activePackageService = ActivePackageService();
  bool isLoaded = true;
  final List<String> categories = [
    'Semua',
    'Selesai',
    'Aktif',
  ];
  int selectIndex = 0;
  ActivePackageModel? _activePackageModel;

  ActivePackageModel? get activePackageModel => _activePackageModel;

  Future<ActivePackageModel?> fetchDataActivePackage() async {
    try {
      _activePackageModel = await _activePackageService.fetchData();
      notifyListeners();
      return _activePackageModel!;
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 404) {
          debugPrint('Error 404: Not Found');
        }
      }
      throw Exception('Gagal mendapatkan data: $e');
    }
  }
}
