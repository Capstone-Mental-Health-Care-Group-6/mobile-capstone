import 'dart:developer';

import 'package:empathi_care/model/services/profile_psikolog_service.dart';
import 'package:empathi_care/view_model/paket_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePsikologProvider extends ChangeNotifier {
  bool isLoading = true;
  bool isInstan = true;
  Map<String, dynamic> dataDoctor = {};
  List workday = [];
  String avgRating = "";
  List ratings = [];
  int session = 0;
  final profileService = ProfilePsikologService();
  late PaketProvider paketProvider;

  List<Map<String, dynamic>> selectedWorkday = [];
  List selectedDate = [];

  void init(BuildContext context, int doctorId) async {
    isLoading = true;
    paketProvider = context.read<PaketProvider>();
    dataDoctor.clear();
    selectedWorkday.clear();
    avgRating = "0";
    isInstan = paketProvider.isInstan;

    session = paketProvider.listPaket[paketProvider.selectedPaket!]['sessions'];
    final pref = await SharedPreferences.getInstance();

    if (isInstan) {
      selectedWorkday.add({"workday": {}, "selected": false});
    }

    log(pref.getString("token").toString());

    await getData(doctorId);

    getAvg();
    await isPremium();
  }

  Future getData(int doctorId) async {
    try {
      dataDoctor = await profileService.getDataDoctor(doctorId);

      workday = dataDoctor['workday'];
      ratings = dataDoctor['ratings'];
      // notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  void getAvg() async {
    int juml = 0;
    for (int i = 0; i < dataDoctor['ratings'].length; i++) {
      juml = juml +
          int.parse(dataDoctor['ratings'][i]['doctor_star_rating'].toString());
    }

    avgRating = ("2.0").toString();

    if (avgRating.length > 4) {
      avgRating = avgRating.substring(0, 4);
    }
  }

  void onSelectWorkday(Map<String, dynamic> selected, int index) {
    selectedWorkday[index]['workday'] = selected;

    notifyListeners();
  }

  Future isPremium() async {
    if (!isInstan) {
      for (int i = 0; i < session; i++) {
        selectedDate.add("");
      }
    }
    isLoading = false;
    notifyListeners();
  }

  void onSelectedDate(int index, String date) {
    selectedDate[index] = date;

    selectedWorkday.add({"workday": {}});
    notifyListeners();
  }
}
