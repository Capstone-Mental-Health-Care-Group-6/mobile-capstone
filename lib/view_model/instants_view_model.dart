import 'package:dio/dio.dart';
import 'package:empathi_care/model/active_package_models.dart';
import 'package:empathi_care/model/services/active_package_services.dart';
import 'package:flutter/material.dart';

class InstantViewModel extends ChangeNotifier {
  final ActivePackageService _activePackageService = ActivePackageService(
    Dio(),
  );

  final List<String> categories = [
    'Semua',
    'Selesai',
    'Aktif',
  ];
  
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDI5MzQyNzYsImlhdCI6MTcwMjg0Nzg3NiwiaWQiOjYzLCJyb2xlIjoiUGF0aWVudCIsInN0YXR1cyI6IkFjdGl2ZSJ9.81Im2iSbg506Gru8Lr2k9dXuEfOuxjeiiwvgFs10pyY";

  int _selectedIndex = 0;

  ActivePackageModel? _activePackageModel;

  ActivePackageModel? get activePackageModel => _activePackageModel;
  int get selectedIndex => _selectedIndex;

  Future<ActivePackageModel> fetchDataInstant(String token) async {
    _activePackageModel = await _activePackageService.fetchData(token);
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