import 'package:dio/dio.dart';
import 'package:empathi_care/model/active_package_models.dart';
import 'package:empathi_care/model/services/active_package_services.dart';
import 'package:flutter/material.dart';

class PremiumViewModel extends ChangeNotifier {
  final ActivePackageService _activePackageService = ActivePackageService(
    Dio(),
  );

  final List<String> categories = [
    'Semua',
    'Selesai',
    'Aktif',
  ];

  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDI4NzkxNTMsImlhdCI6MTcwMjc5Mjc1MywiaWQiOjYzLCJyb2xlIjoiUGF0aWVudCIsInN0YXR1cyI6IkFjdGl2ZSJ9.kDsfAWh1RA_7YhB6jcJdlr9x-pBVLxS_NdkORKErLNQ";

  int _selectedIndex = 0;
  ActivePackageModel? _activePackageModel;

  ActivePackageModel? get activePackageModel => _activePackageModel;
  int get selectedIndex => _selectedIndex;

  Future<ActivePackageModel> fetchDataPremium() async {
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
