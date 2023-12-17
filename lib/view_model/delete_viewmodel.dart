import 'package:dio/dio.dart';
import 'package:empathi_care/model/inactive_patient_model.dart';
import 'package:empathi_care/model/services/inactive_patient_services.dart';
import 'package:flutter/material.dart';

class InactivatePatientViewModel extends ChangeNotifier {
  InactivePatientModel? inactivePatientModel;
  InactivePatientService inactivePatientService = InactivePatientService();

  Future inactivatePatient() async {
    try {
      inactivePatientModel = await inactivePatientService.inactivePatient();
    } catch (e) {
      if (e is DioException) {
        rethrow;
      }
    }
  }
}
