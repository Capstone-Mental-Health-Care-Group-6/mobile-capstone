import 'package:empathi_care/model/active_package_models.dart';
import 'package:empathi_care/model/services/active_package_services.dart';
import 'package:flutter/material.dart';

class InstantViewModel extends ChangeNotifier {
  final ActivePackageService _activePackageService = ActivePackageService();

  final List<String> categories = [
    'Semua',
    'Selesai',
    'Aktif',
  ];

  int _selectedIndex = 0;

  ActivePackageModel? _activePackageModel;

  ActivePackageModel? get activePackageModel => _activePackageModel;
  int get selectedIndex => _selectedIndex;

  Future<ActivePackageModel> fetchDataInstant() async {
    _activePackageModel = await _activePackageService.fetchData();
    try {
      if (_activePackageModel != null) {
        notifyListeners();
        return _activePackageModel!;
      } else {
        throw Exception('Failed to fetch active package');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  void selectCategories(index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
