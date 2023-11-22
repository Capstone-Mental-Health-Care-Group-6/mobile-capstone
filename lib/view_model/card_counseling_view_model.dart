import 'package:empathi_care/model/card_counseling_model.dart';
import 'package:flutter/material.dart';

class CardCounselingViewModel extends ChangeNotifier {
  List<CardCounselingModel> data = [
    CardCounselingModel(
      image: 'assets/doctors2.png',
      doctorName: 'Rangga S.Psi., M.Psi',
      specialist: 'Spesialis Psikolog',
      method: 'Metode Chat instan',
      topic: 'Topik Stress',
      status: 'Percakapan Masih dibuka',
      textButton: 'Mulai Chat',
    ),
    CardCounselingModel(
      image: 'assets/doctors1.png',
      doctorName: 'Melani S,psi., M,Psi',
      specialist: 'Spesialis Psikolog',
      method: 'Metode Chat instan',
      topic: 'Topik Stress',
      status: 'Percakapan sudah ditutup',
      textButton: 'Chat Kembali',
    ),
  ];
}
