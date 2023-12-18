import 'package:dio/dio.dart';
import 'package:empathi_care/model/get_patient_by_id_model.dart';
import 'package:empathi_care/model/services/get_patient_by_id_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetPatientByIdViewModel extends ChangeNotifier {
  GetPatientbyIdServices getPatientbyIdServices = GetPatientbyIdServices();
  Data? getPatientbyIdModel;
  String email = '';
  String name = '';
  DateTime? birth;
  String gender = '';
  String avatar = '';
  String phone = '';

  late SharedPreferences sp;

  Future getPatientbyID() async {
    try {
      sp = await SharedPreferences.getInstance();
      getPatientbyIdModel = await getPatientbyIdServices.getPatientById();
      notifyListeners();
      sp.setString('email', getPatientbyIdModel!.email);
      sp.setString('name', getPatientbyIdModel!.name);
      sp.setString('birth', getPatientbyIdModel!.dateOfBirth.toString());
      sp.setString('gender', getPatientbyIdModel!.gender);
      sp.setString('avatar', getPatientbyIdModel!.avatar);
      sp.setString('phone', getPatientbyIdModel!.phoneNumber);
      notifyListeners();
      email = sp.getString('email').toString();
      name = sp.getString('name').toString();
      birth = DateTime.parse(sp.getString('birth').toString());
      gender = sp.getString('gender').toString();
      avatar = sp.getString('avatar').toString();
      phone = sp.getString('phone').toString();
      notifyListeners();
    } catch (e) {
      if (e is DioException) {
        rethrow;
      }
    }
  }
}
