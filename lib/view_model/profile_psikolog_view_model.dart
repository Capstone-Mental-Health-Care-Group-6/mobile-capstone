import 'dart:developer';

import 'package:empathi_care/model/services/profile_psikolog_service.dart';
import 'package:flutter/material.dart';
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

  List<Map<String, dynamic>> selectedWorkday = [];
  List selectedDate = [];

  void init(bool instan) async {
    dataDoctor.clear();
    selectedWorkday.clear();
    avgRating = "0";
    isInstan = instan;

    session = 2;
    final pref = await SharedPreferences.getInstance();

    if (isInstan) {
      selectedWorkday.add({"workday": {}, "selected": false});
    }

    await pref.setString('token',
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDI5MTMxMDgsImlhdCI6MTcwMjgyNjcwOCwiaWQiOjUsInJvbGUiOiJQYXRpZW50Iiwic3RhdHVzIjoiQWN0aXZlIn0.8ogVb7Bk5INio-gT4wHYhWqT2cX7bnzCBiuYgNfSLlc");

    log(pref.getString("token").toString());

    await getData();

    getAvg();
    await isPremium();
  }

  Future getData() async {
    try {
      dataDoctor = await profileService.getDataDoctor("13");

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
      juml = juml + int.parse(dataDoctor['ratings'][i]['doctor_star_rating'].toString());
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
