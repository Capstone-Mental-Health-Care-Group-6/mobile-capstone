import 'package:dio/dio.dart';
import 'package:empathi_care/model/active_package_model.dart';
import 'package:empathi_care/model/services/active_package_services.dart';
import 'package:flutter/material.dart';

class ActivePackageViewModel extends ChangeNotifier {
  final ActivePackageService _activePackageService = ActivePackageService(
    Dio(),
  );
  bool isLoaded = true;
  final List<String> categories = [
    'Semua',
    'Selesai',
    'Aktif',
  ];
  int selectIndex = 0;
  ActivePackageModel? _activePackageModel;

  ActivePackageModel? get activePackageModel => _activePackageModel;

  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDI4NzkxNTMsImlhdCI6MTcwMjc5Mjc1MywiaWQiOjYzLCJyb2xlIjoiUGF0aWVudCIsInN0YXR1cyI6IkFjdGl2ZSJ9.kDsfAWh1RA_7YhB6jcJdlr9x-pBVLxS_NdkORKErLNQ";

  Future<void> delayLoading(String token) async {
    if (isLoaded) {
      await fetchDataActivePackage(token);
    }


    await Future.delayed(
      const Duration(seconds: 5),
    ).then((value) {
      isLoaded = false;
      notifyListeners();
    });
  }


  Future<ActivePackageModel> fetchDataActivePackage(String token) async {
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
}
