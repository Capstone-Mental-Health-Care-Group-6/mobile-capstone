import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:empathi_care/model/services/psikolog_service.dart';
import 'package:empathi_care/model/psikolog_model.dart';

class PsikologProvider extends ChangeNotifier{
  final PsikologApiService _apiService = PsikologApiService();
  TextEditingController searchController = TextEditingController();
  bool isLoading = true, notFound = false;

  Psikolog? dataPsikolog;

  Future<void> fetchListPsikolog(String token) async {
    try {
      isLoading = true;
      dataPsikolog = await _apiService.fetchPsikolog(token);
      isLoading = false;
    } catch (e) {
      throw Exception(e);
    }
    notifyListeners();
  }

  Future<void> fetchListPsikologSearch(String token) async {
    try {
      dataPsikolog = await _apiService.fetchPsikologSearch(token,searchController.text);
      isLoading = false;
      notFound = false;
    } catch (e) {
      notFound = true;
    }
    notifyListeners();
  }
}