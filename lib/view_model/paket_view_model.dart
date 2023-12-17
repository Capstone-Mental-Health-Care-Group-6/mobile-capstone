import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:empathi_care/model/services/paket_service.dart';
import 'package:flutter/material.dart';

class PaketProvider extends ChangeNotifier {
  bool isInstan = true, isLoading = true;
  int? selectedPaket;
  int selectedMetode = 1, selectedDuration = 1;
  PaketService paketService = PaketService();

  List listPaket = [], listMethods = [], listDuration = [];

  Future init(BuildContext context) async {
    isInstan = true;
    isLoading = true;
    selectedDuration = 1;
    selectedMetode = 1;

    await getPaket("INSTAN", context);
    await getMethod(context);
    await getDuration();
  }

  Future getPaket(String metode, BuildContext context) async {
    try {
      listPaket = await paketService.getPaket(metode, selectedMetode.toString(), selectedDuration.toString());
      notifyListeners();
    } catch (e) {
      if (e is DioException) {
        isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message.toString()),
          ),
        );
      }
    }
  }

  Future getMethod(BuildContext context) async {
    try {
      listMethods = await paketService.getMetohod();

      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future getDuration() async {
    try {
      listDuration = await paketService.getDuration();
      isLoading = false;

      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  void onSelectPaket(int index) {
    selectedPaket = index;
    notifyListeners();
  }

  void onChangeType(BuildContext context) {
    if (isInstan) {
      getPaket("PREMIUM", context);
      isInstan = false;
    } else {
      getPaket("INSTAN", context);
      isInstan = true;
    }
    selectedPaket = null;
    notifyListeners();
  }
}