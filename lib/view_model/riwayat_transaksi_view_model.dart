import 'package:dio/dio.dart';
import 'package:empathi_care/model/riwayat_transaksi_model.dart';
import 'package:empathi_care/model/services/riwayat_transaksi_services.dart';
import 'package:flutter/material.dart';

class RiwayatTransaksiProvider extends ChangeNotifier {
  final RiwayatTransaksiServices _apiService = RiwayatTransaksiServices(Dio());
  RiwayatTransaksi? _riwayatTransaksi; 

  RiwayatTransaksi? get riwayatTransaksi => _riwayatTransaksi;

  Future<RiwayatTransaksi> getData(String token) async {
    try {
      _riwayatTransaksi = await _apiService.fetchRiwayatTransaksi(token);
      notifyListeners();
      return _riwayatTransaksi!;
    } catch (e) {
      throw Exception('Gagal mendapatkan data pengguna: $e');
    }
  }

  
}

