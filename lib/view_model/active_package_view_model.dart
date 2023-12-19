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

  Future<void> delayLoading() async {
    if (isLoaded) {
      await fetchDataActivePackage();
    }
    await Future.delayed(
      const Duration(seconds: 5),
    ).then((value) {
      isLoaded = false;
      notifyListeners();
    });
  }

  Future<ActivePackageModel> fetchDataActivePackage() async {
    try {
      // if (_activePackageModel != null) {
        _activePackageModel = await _activePackageService.fetchData();
        notifyListeners();
        return _activePackageModel!;
      // } else {
        // throw Exception('Failed to fetch active package');
      // }
    } catch (e) {
      throw Exception('Gagal mendapatkan data: $e');
    }
  }
}
