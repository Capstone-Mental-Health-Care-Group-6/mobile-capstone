import 'package:empathi_care/model/riwayat_transaksi_model.dart';
import 'package:empathi_care/model/services/riwayat_transaksi_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RiwayatTransaksiProvider extends ChangeNotifier {
  final RiwayatTransaksiServices _apiService = RiwayatTransaksiServices();
  RiwayatTransaksi? _riwayatTransaksi;

  RiwayatTransaksi? get riwayatTransaksi => _riwayatTransaksi;

  Future<RiwayatTransaksi> getData() async {
    try {
      _riwayatTransaksi = await _apiService.fetchRiwayatTransaksi();
      notifyListeners();
      return _riwayatTransaksi!;
    } catch (e) {
      throw Exception('Gagal mendapatkan data pengguna: $e');
    }
  }

  String _id = '';

  String get id => _id;

  void setId(String newId) {
    _id = newId;
  }

  final List _transactionid = [];
  List get transactionId => _transactionid;
  void addata() {
    _transactionid.add(id);
    debugPrint(transactionId.toString());
  }
}
